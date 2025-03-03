using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Identity;

namespace HomeCare_EXE201.Models;

public partial class UserRole : IdentityUserRole<int>
{
    public override int UserId { get; set; }
    public override int RoleId { get; set; }
    public DateTime? CreatedDate { get; set; }

    public virtual Role Role { get; set; } = null!;

    public virtual User User { get; set; } = null!;
}
