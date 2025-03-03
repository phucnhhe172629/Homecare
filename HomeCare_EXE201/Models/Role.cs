using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Identity;

namespace HomeCare_EXE201.Models;

public partial class Role : IdentityRole<int>
{
    public Role()
    {
        RoleClaims = new HashSet<RoleClaim>();
        UserRoles = new HashSet<UserRole>();
    }

    public Role(String roleName)
    {
        Name = roleName;
        RoleClaims = new HashSet<RoleClaim>();
        UserRoles = new HashSet<UserRole>();
    }

    public override int Id { get; set; }
    public override string? Name { get; set; }
    public override string? NormalizedName { get; set; }
    public override string? ConcurrencyStamp { get; set; }

    public virtual ICollection<RoleClaim> RoleClaims { get; set; }

    public virtual ICollection<UserRole> UserRoles { get; set; } 
}
