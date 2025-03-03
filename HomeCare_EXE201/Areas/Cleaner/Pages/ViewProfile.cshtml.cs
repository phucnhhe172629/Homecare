using HomeCare_EXE201.Models;
using HomeCare_EXE201.Service;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace HomeCare_EXE201.Areas.Cleaner.Pages
{
    public class ViewProfileModel : PageModel
    {
        private readonly HomeCareExe201Context _context;
        private readonly IUserService _userService;

        public User User { get; set; }

        public ViewProfileModel(HomeCareExe201Context context, IUserService userService)
        {
            _context = context;
            _userService = userService;
        }

        public void OnGet()
        {
            User = _userService.GetCurrentUser();
        }

        public IActionResult OnPostStatus(string statusUpdate)
        {
            var user = _context.Users.Find(1);
            if (user != null)
            {
                user.status = statusUpdate;
                _context.SaveChanges();
            }
            return RedirectToPage();
        }

    }
}
