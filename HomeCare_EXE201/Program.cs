using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using HomeCare_EXE201.Models;
using HomeCare_EXE201.Service;

var builder = WebApplication.CreateBuilder(args);

var connectionString = builder.Configuration.GetConnectionString("value") ?? throw new InvalidOperationException("Connection string 'HomeCareExe201ContextConnection' not found.");

builder.Services.AddDbContext<HomeCareExe201Context>(options 
    => options.UseSqlServer(connectionString));

builder.Services.AddDefaultIdentity<User>(options =>
{
    options.SignIn.RequireConfirmedAccount = false;
    options.Password.RequireDigit = false;
    options.Password.RequireNonAlphanumeric = false;
    options.Password.RequireLowercase = false;
    options.Password.RequireUppercase = false;
    options.Password.RequiredLength = 8;
})
    .AddRoles<Role>()
    .AddEntityFrameworkStores<HomeCareExe201Context>();

//Add services to the container.
builder.Services.AddRazorPages();

builder.Services.Configure<DataProtectionTokenProviderOptions>(options =>
{
    options.TokenLifespan = TimeSpan.FromMinutes(3);
});

builder.Services.AddScoped<IUserService, UserService>();
builder.Services.AddScoped<IBookService, BookService>();

builder.Services.AddAuthorization(options =>
{
    options.AddPolicy("RequireAdminRole",
        policy => policy.RequireRole("Admin"));
    options.AddPolicy("RequireCustomerRole",
        policy => policy.RequireRole("Customer"));
    options.AddPolicy("RequireCleanerRole",
        policy => policy.RequireRole("Cleaner"));
});

builder.Services.AddRazorPages()
    .AddRazorPagesOptions(options =>
    {
        options.Conventions.AddAreaPageRoute("Public", "/Home", "");
        //options.Conventions.AddAreaPageRoute("Public", "/ProductSuggestion", "");

        options.Conventions.AuthorizeAreaFolder("Admin", "/", "RequireAdminRole");
        options.Conventions.AuthorizeAreaFolder("Cleaner", "/", "RequireCleanerRole");
        options.Conventions.AuthorizeAreaFolder("Customer", "/", "RequireCustomerRole");
    });

builder.Services.AddSession(options =>
{
    options.IdleTimeout = TimeSpan.FromMinutes(30);
});


var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}




app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthentication();

app.UseAuthorization();

app.MapGet("/", () => Results.Redirect("Guest/Index"));

app.MapRazorPages();

app.UseSession();

app.Run();
