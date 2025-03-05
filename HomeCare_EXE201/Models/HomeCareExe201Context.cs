using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace HomeCare_EXE201.Models;

public partial class HomeCareExe201Context : IdentityDbContext<User, Role, int,
        UserClaim, UserRole, UserLogin,
        RoleClaim, UserToken>
{
    public HomeCareExe201Context()
    {
    }

    public HomeCareExe201Context(DbContextOptions<HomeCareExe201Context> options)
        : base(options)
    {
    }

    public virtual DbSet<Booking> Bookings { get; set; } = null!;

    public virtual DbSet<BookingDetail> BookingDetails { get; set; } = null!;

    public virtual DbSet<BookingService> BookingServices { get; set; } = null!;

    public virtual DbSet<Payment> Payments { get; set; } = null!;

    public virtual DbSet<Report> Reports { get; set; } = null!;

    public virtual DbSet<Review> Reviews { get; set; } = null!;

    public virtual DbSet<Role> Roles { get; set; } = null!;

    public virtual DbSet<RoleClaim> RoleClaims { get; set; } = null!;

    public virtual DbSet<Service> Services { get; set; } = null!;

    public virtual DbSet<User> Users { get; set; } = null!;

    public virtual DbSet<UserClaim> UserClaims { get; set; } = null!;

    public virtual DbSet<UserLogin> UserLogins { get; set; } = null!;

    public virtual DbSet<UserRole> UserRoles { get; set; } = null!;

    public virtual DbSet<UserToken> UserTokens { get; set; } = null!;

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        if (!optionsBuilder.IsConfigured)
        {
            var ConnectionString = new ConfigurationBuilder().AddJsonFile("appsettings.json").Build().GetConnectionString("value");
            optionsBuilder.UseSqlServer(ConnectionString);
        }
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Booking>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Booking__3213E83F3968D62B");

            entity.ToTable("Booking");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Address)
                .HasMaxLength(255)
                .HasColumnName("address");
            entity.Property(e => e.CleanerId).HasColumnName("cleanerId");
            entity.Property(e => e.CreateAt).HasColumnName("createAt");
            entity.Property(e => e.CreateBy).HasColumnName("createBy");
            entity.Property(e => e.CustomerId).HasColumnName("customerId");
            entity.Property(e => e.Date).HasColumnName("date");
            entity.Property(e => e.IsDeleted)
                .HasDefaultValue(false)
                .HasColumnName("isDeleted");
            entity.Property(e => e.Status).HasColumnName("status");
            entity.Property(e => e.TotalPrice)
                .HasColumnType("decimal(18, 2)")
                .HasColumnName("totalPrice");
            entity.Property(e => e.UpdateAt).HasColumnName("updateAt");
            entity.Property(e => e.UpdateBy).HasColumnName("updateBy");

            entity.HasOne(d => d.Customer).WithMany(p => p.Bookings)
                .HasForeignKey(d => d.CustomerId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Booking_User");
        });

        modelBuilder.Entity<BookingDetail>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__BookingD__3213E83F846C7BD2");

            entity.ToTable("BookingDetail");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.AfterImg)
                .IsUnicode(false)
                .HasColumnName("afterImg");
            entity.Property(e => e.BeforeImg)
                .IsUnicode(false)
                .HasColumnName("beforeImg");
            entity.Property(e => e.BookingId).HasColumnName("bookingId");
            entity.Property(e => e.CreateAt).HasColumnName("createAt");
            entity.Property(e => e.CreateBy).HasColumnName("createBy");
            entity.Property(e => e.IsDeleted)
                .HasDefaultValue(false)
                .HasColumnName("isDeleted");
            entity.Property(e => e.UpdateAt).HasColumnName("updateAt");
            entity.Property(e => e.UpdateBy).HasColumnName("updateBy");

            entity.HasOne(d => d.Booking).WithMany(p => p.BookingDetails)
                .HasForeignKey(d => d.BookingId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_BookingDetail_Booking");
        });

        modelBuilder.Entity<BookingService>(entity =>
        {
            entity.HasKey(e => new { e.BookingId, e.ServiceId }).HasName("PK__Booking___22853CC0416E7697");

            entity.ToTable("Booking_Services");

            entity.Property(e => e.BookingId).HasColumnName("bookingId");
            entity.Property(e => e.ServiceId).HasColumnName("serviceId");
            entity.Property(e => e.CreateAt).HasColumnName("createAt");
            entity.Property(e => e.CreateBy).HasColumnName("createBy");
            entity.Property(e => e.IsDeleted)
                .HasDefaultValue(false)
                .HasColumnName("isDeleted");
            entity.Property(e => e.UpdateAt).HasColumnName("updateAt");
            entity.Property(e => e.UpdateBy).HasColumnName("updateBy");

            entity.HasOne(d => d.Booking).WithMany(p => p.BookingServices)
                .HasForeignKey(d => d.BookingId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Booking_Services_Booking");

            entity.HasOne(d => d.Service).WithMany(p => p.BookingServices)
                .HasForeignKey(d => d.ServiceId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Booking_Services_Service");
        });

        modelBuilder.Entity<Payment>(entity =>
        {
            entity.ToTable("Payments");
            entity.HasKey(e => e.Id).HasName("PK__Payments__3213E83FC92D7E41");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Amount)
                .HasColumnType("decimal(18, 2)")
                .HasColumnName("amount");
            entity.Property(e => e.BookingId).HasColumnName("bookingId");
            entity.Property(e => e.CreateAt).HasColumnName("createAt");
            entity.Property(e => e.CreateBy).HasColumnName("createBy");
            entity.Property(e => e.IsDeleted)
                .HasDefaultValue(false)
                .HasColumnName("isDeleted");
            entity.Property(e => e.Status).HasColumnName("status");
            entity.Property(e => e.UpdateAt).HasColumnName("updateAt");
            entity.Property(e => e.UpdateBy).HasColumnName("updateBy");

            entity.HasOne(d => d.Booking).WithMany(p => p.Payments)
                .HasForeignKey(d => d.BookingId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Payments_Booking");
        });

        modelBuilder.Entity<Report>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Report__3213E83F0F0B37AD");

            entity.ToTable("Report");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.BookingId).HasColumnName("bookingId");
            entity.Property(e => e.Content).HasColumnName("content");
            entity.Property(e => e.CreateAt).HasColumnName("createAt");
            entity.Property(e => e.CreateBy).HasColumnName("createBy");
            entity.Property(e => e.Image).HasColumnName("image");
            entity.Property(e => e.IsDeleted)
                .HasDefaultValue(false)
                .HasColumnName("isDeleted");
            entity.Property(e => e.Status)
                .HasMaxLength(50)
                .HasColumnName("status");
            entity.Property(e => e.UpdateAt).HasColumnName("updateAt");
            entity.Property(e => e.UpdateBy).HasColumnName("updateBy");

            entity.HasOne(d => d.Booking).WithMany(p => p.Reports)
                .HasForeignKey(d => d.BookingId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Report_Booking");
        });

        modelBuilder.Entity<Review>(entity =>
        {
            entity.ToTable("Reviews");
            entity.HasKey(e => e.Id).HasName("PK__Reviews__3213E83FA79FCFFF");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.BookingId).HasColumnName("bookingId");
            entity.Property(e => e.Comment).HasColumnName("comment");
            entity.Property(e => e.CreateAt).HasColumnName("createAt");
            entity.Property(e => e.CreateBy).HasColumnName("createBy");
            entity.Property(e => e.CustomerId).HasColumnName("customerId");
            entity.Property(e => e.IsDeleted)
                .HasDefaultValue(false)
                .HasColumnName("isDeleted");
            entity.Property(e => e.Rating).HasColumnName("rating");
            entity.Property(e => e.UpdateAt).HasColumnName("updateAt");
            entity.Property(e => e.UpdateBy).HasColumnName("updateBy");

            entity.HasOne(d => d.Booking).WithMany(p => p.Reviews)
                .HasForeignKey(d => d.BookingId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Reviews_Booking");
        });

        modelBuilder.Entity<Role>(entity =>
        {
            entity.ToTable("Roles");
            entity.Property(e => e.Name).HasMaxLength(256);
            entity.Property(e => e.NormalizedName).HasMaxLength(256);
        });

        modelBuilder.Entity<RoleClaim>(entity =>
        {
            entity.ToTable("RoleClaims");
            entity.HasOne(d => d.Role).WithMany(p => p.RoleClaims).HasForeignKey(d => d.RoleId);
        });

        modelBuilder.Entity<Service>(entity =>
        {
            entity.ToTable("Services");
            entity.HasKey(e => e.Id).HasName("PK__Services__3213E83F18819660");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.CreateAt).HasColumnName("createAt");
            entity.Property(e => e.CreateBy).HasColumnName("createBy");
            entity.Property(e => e.Description).HasColumnName("description");
            entity.Property(e => e.IsDeleted)
                .HasDefaultValue(false)
                .HasColumnName("isDeleted");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .HasColumnName("name");
            entity.Property(e => e.Price)
                .HasColumnType("decimal(18, 2)")
                .HasColumnName("price");
            entity.Property(e => e.UpdateAt).HasColumnName("updateAt");
            entity.Property(e => e.UpdateBy).HasColumnName("updateBy");
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__User__3213E83F71DD797A");

            entity.ToTable("User");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.City)
                .HasMaxLength(30)
                .IsUnicode(false)
                .HasColumnName("city");
            entity.Property(e => e.Country)
                .HasMaxLength(30)
                .IsUnicode(false)
                .HasColumnName("country");
            entity.Property(e => e.status)
                .HasMaxLength(30)
                .IsUnicode(false)
                .HasColumnName("status");
            entity.Property(e => e.Email).HasMaxLength(256);
            entity.Property(e => e.FirstName)
                .HasMaxLength(50)
                .HasColumnName("firstName");
            entity.Property(e => e.LastName)
                .HasMaxLength(50)
                .HasColumnName("lastName");
            entity.Property(e => e.NormalizedEmail).HasMaxLength(256);
            entity.Property(e => e.NormalizedUserName).HasMaxLength(256);
            entity.Property(e => e.Province)
                .HasMaxLength(30)
                .IsUnicode(false)
                .HasColumnName("province");
            entity.Property(e => e.Street)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("street");
            entity.Property(e => e.UserName).HasMaxLength(256);
        });

        modelBuilder.Entity<UserClaim>(entity =>
        {
            entity.ToTable("UserClaims");
            entity.HasOne(d => d.User).WithMany(p => p.UserClaims).HasForeignKey(d => d.UserId);
        });

        modelBuilder.Entity<UserLogin>(entity =>
        {
            entity.HasKey(e => new { e.LoginProvider, e.ProviderKey });

            entity.Property(e => e.LoginProvider).HasMaxLength(128);
            entity.Property(e => e.ProviderKey).HasMaxLength(128);

            entity.HasOne(d => d.User).WithMany(p => p.UserLogins).HasForeignKey(d => d.UserId);
        });

        modelBuilder.Entity<UserRole>(entity =>
        {
            entity.ToTable("UserRoles");
            entity.HasKey(e => new { e.UserId, e.RoleId });

            entity.HasOne(d => d.Role).WithMany(p => p.UserRoles).HasForeignKey(d => d.RoleId);

            entity.HasOne(d => d.User).WithMany(p => p.UserRoles).HasForeignKey(d => d.UserId);
        });

        modelBuilder.Entity<UserToken>(entity =>
        {
            entity.ToTable("UserTokens");
            entity.HasKey(e => new { e.UserId, e.LoginProvider, e.Name });

            entity.Property(e => e.LoginProvider).HasMaxLength(128);
            entity.Property(e => e.Name).HasMaxLength(128);

            entity.HasOne(d => d.User).WithMany(p => p.UserTokens).HasForeignKey(d => d.UserId);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
