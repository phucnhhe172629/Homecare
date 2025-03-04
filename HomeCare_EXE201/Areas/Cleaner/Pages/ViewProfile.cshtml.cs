using HomeCare_EXE201.Models;
using HomeCare_EXE201.Service;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace HomeCare_EXE201.Areas.Cleaner.Pages
{
    public class ViewProfileModel : PageModel
    {
        private readonly HomeCareExe201Context _context;
        private readonly IUserService _userService;
        private readonly IHttpContextAccessor _contextAccessor;
        private readonly UserManager<User> _userManager;

        public User User { get; set; }

        public ViewProfileModel(HomeCareExe201Context context, IUserService userService, IHttpContextAccessor contextAccessor, UserManager<User> userManager)
        {
            _context = context;
            _userService = userService;
            _contextAccessor = contextAccessor;
            _userManager = userManager;
        }

        public void OnGet()
        {
            User = _userService.GetCurrentUser();
        }

        public IActionResult OnPost([FromForm] string statusUpdate)
        {
            var customerId = _userManager.GetUserId(_contextAccessor.HttpContext.User);
            var user = _context.Users.FirstOrDefault(x => x.Id == int.Parse(customerId));

            if (user != null)
            {
                user.status = statusUpdate;
                _context.SaveChanges();
            }
            return RedirectToPage();
        }

    }
}