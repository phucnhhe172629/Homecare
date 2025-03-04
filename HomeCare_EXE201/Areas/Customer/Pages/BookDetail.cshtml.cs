using HomeCare_EXE201.Models;
using HomeCare_EXE201.Service;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace HomeCare_EXE201.Areas.Customer.Pages
{
    public class BookDetailModel : PageModel
    {
        private readonly HomeCareExe201Context _context;
        private readonly IUserService _userService;
        private readonly IHttpContextAccessor _contextAccessor;
        private readonly UserManager<User> _userManager;

        public Booking Booking { get; set; }

        public Models.Service Service { get; set; }

        public User User { get; set; } = new User();

        public BookDetailModel(HomeCareExe201Context context, IUserService userService, IHttpContextAccessor contextAccessor, UserManager<User> userManager)
        {
            _context = context;
            _userService = userService;
            _contextAccessor = contextAccessor;
            _userManager = userManager;
        }

        public IActionResult OnGet(int id)
        {


            var customerId = _userManager.GetUserId(_contextAccessor.HttpContext.User);
            var user = _context.Users.FirstOrDefault(x => x.Id == int.Parse(customerId));
            User = user;

            Booking = _context.Bookings.FirstOrDefault(b => b.Id == id);

            int serviceId = _context.BookingServices
                .Where(bs => bs.BookingId == Booking.Id)
                .Select(bs => bs.ServiceId)
                .SingleOrDefault();
            Service = _context.Services.FirstOrDefault(s => s.Id == serviceId);




            return Page();
        }

        public IActionResult OnPostConfirm(int id)
        {
            var booking = _context.Bookings.Find(id);
            if (booking != null)
            {
                booking.Status = "Complete";
                _context.SaveChanges();
            }
            return RedirectToPage("ListBooking");
        }
    }
}
