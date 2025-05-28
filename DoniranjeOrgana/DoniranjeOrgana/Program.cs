using DoniranjeOrgana;
using DoniranjeOrgana.Filter;
using DoniranjeOrgana.Models.Model;
using DoniranjeOrgana.Service.RabbitMQ;
using DoniranjeOrgana.Services.Database;
using DoniranjeOrgana.Services.RabbitMQ;
using DoniranjeOrgana.Services.Service;
using Microsoft.AspNetCore.Authentication;
using Microsoft.EntityFrameworkCore;
using Microsoft.OpenApi.Models;
using Newtonsoft.Json.Serialization;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
builder.Services.AddSwaggerGen();


builder.Services.AddTransient<IKorisnikService, KorisnikService>();
builder.Services.AddTransient<IDoktorService, DoktorService>();
builder.Services.AddTransient<IPacijentService, PacijentService>();
builder.Services.AddTransient<ISpecijalizacijaService, SpecijalizacijaService>();
builder.Services.AddTransient<IPreventivneMjereService, PreventivneMjereService>();
builder.Services.AddTransient<IOsiguranjeService, OsiguranjeService>();
builder.Services.AddTransient<IPacijentOsiguranjeService, PacijentOsiguranjeService>();
builder.Services.AddTransient<INalazService, NalazService>();
builder.Services.AddTransient<ITerapijaService, TerapijaService>();
builder.Services.AddTransient<IUlogaService, UlogaService>();
builder.Services.AddTransient<IKorisnikUlogaService, KorisnikUlogaService>();
builder.Services.AddTransient<IOboljenjeService, OboljenjeService>();
builder.Services.AddTransient<IDonorskiFormularService, DonorskiFormularService>();
builder.Services.AddTransient<IDonoriService, DonoriService>();
builder.Services.AddTransient<IDonacijiKrviService, DonacijaKrviService>();


builder.Services.AddSingleton<IMailProducer, MailProducer>();
builder.Services.AddScoped<IEmailService, EmailService>();



builder.Services.AddControllers()
    .AddNewtonsoftJson(options =>
    {
        options.SerializerSettings.ContractResolver = new Newtonsoft.Json.Serialization.DefaultContractResolver();
    });

builder.Services.AddControllers(x =>
{
    x.Filters.Add<ErrorFilter>();
});
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(c =>
{
    c.AddSecurityDefinition("Basic", new OpenApiSecurityScheme
    {
        Type = SecuritySchemeType.Http,
        Scheme = "basic"
    });

    c.AddSecurityRequirement(new OpenApiSecurityRequirement()
    {
        {
            new OpenApiSecurityScheme
            {
                Reference = new OpenApiReference
                {
                    Type = ReferenceType.SecurityScheme,
                    Id = "Basic"
                }
            },
            new string[] {}
        }
    });
});
var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");
builder.Services.AddDbContext<DoniranjeOrganaContext>(options => options.UseSqlServer(connectionString));

builder.Services.AddAutoMapper(typeof(IKorisnikService));

builder.Services.AddAuthentication("BasicAuthentication")
    .AddScheme<AuthenticationSchemeOptions, BasicAuthenticationHandler>("BasicAuthentication", null);

builder.Services.AddControllers().AddNewtonsoftJson(options =>
{
    options.SerializerSettings.ContractResolver = new DefaultContractResolver
    {
        NamingStrategy = new CamelCaseNamingStrategy()
    };
    options.SerializerSettings.ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore;
});


var app = builder.Build();
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

// Configure the HTTP request pipeline.

app.UseHttpsRedirection();

app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();
using (var scope = app.Services.CreateScope())
{
    var dataContext = scope.ServiceProvider.GetRequiredService<DoniranjeOrganaContext>();
    dataContext.Database.Migrate();
}

app.Run();
