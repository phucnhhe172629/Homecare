using HomeCare_EXE201.Models;
using HomeCare_EXE201.Service;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

namespace HomeCare_EXE201.Areas.Customer.Pages
{
    public class ListBookingModel : PageModel
    {

        private readonly HomeCare_EXE201.Models.HomeCareExe201Context _context;
        private readonly IUserService _userService;

        public ListBookingModel(HomeCare_EXE201.Models.HomeCareExe201Context context, IUserService userService)
        {
            _context = context;
            _userService = userService;
        }

        public User User { get; set; }
        public IList<Booking> Booking { get; set; } = default!;

        public void OnGet()
        {
            User = _userService.GetCurrentUser();

            Booking = _context.Bookings
                .Where(b => b.CustomerId == User.Id)
                .ToList();


        }
    }
}
