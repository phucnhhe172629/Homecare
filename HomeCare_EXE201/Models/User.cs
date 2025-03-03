using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;

namespace HomeCare_EXE201.Models;

public partial class User : IdentityUser<int>
{
    public User()
    {
        Bookings = new HashSet<Booking>();
        UserClaims = new HashSet<UserClaim>();
        UserLogins = new HashSet<UserLogin>();
        UserRoles = new HashSet<UserRole>();
        UserTokens = new HashSet<UserToken>();
    }
    public override int Id { get; set; }

    public string? FirstName { get; set; }

    public string? LastName { get; set; }

    public string? Street { get; set; }

    public string? City { get; set; }

    public string? Province { get; set; }

    public string? Country { get; set; }

    public override string? UserName { get; set; }
    public string? status { get; set; }

    public override string? NormalizedUserName { get; set; }

    public override string? Email { get; set; }

    public override string? NormalizedEmail { get; set; }

    public override bool EmailConfirmed { get; set; }

    public override string? PasswordHash { get; set; }

    public override string? SecurityStamp { get; set; }

    public override string? ConcurrencyStamp { get; set; } = Guid.NewGuid().ToString();

    public override string? PhoneNumber { get; set; }

    public override bool PhoneNumberConfirmed { get; set; }

    public override bool TwoFactorEnabled { get; set; }

    //public DateTimeOffset? LockoutEnd { get; set; }

    //public bool LockoutEnabled { get; set; }

    public override int AccessFailedCount { get; set; }

    public virtual ICollection<Booking> Bookings { get; set; } 

    public virtual ICollection<UserClaim> UserClaims { get; set; } 

    public virtual ICollection<UserLogin> UserLogins { get; set; } 

    public virtual ICollection<UserRole> UserRoles { get; set; } 

    public virtual ICollection<UserToken> UserTokens { get; set; } 
}
