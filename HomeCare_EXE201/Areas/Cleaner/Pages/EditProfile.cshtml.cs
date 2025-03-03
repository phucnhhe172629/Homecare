using HomeCare_EXE201.Models;
using HomeCare_EXE201.Service;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace HomeCare_EXE201.Areas.Cleaner.Pages
{
    public class EditProfileModel : PageModel
    {
        private readonly HomeCareExe201Context _context;
        private readonly IUserService _userService;

        public User User { get; set; }
        public EditProfileModel(HomeCareExe201Context context, IUserService userService)
        {
            _context = context;
            _userService = userService;
        }

        public void OnGet()
        {
            User = _userService.GetCurrentUser();
        }

        public IActionResult OnPostUpdateProfile(string username, string firstName, string lastName, string email, string phone, string address, string city, string province)
        {
            var user = _userService.GetCurrentUser();
            if (user == null)
            {
                return NotFound();
            }
            if (!ModelState.IsValid)
            {
                return Page();
            }
            user.UserName = username;
            user.FirstName = firstName;
            user.LastName = lastName;
            user.Email = email;
            user.PhoneNumber = phone;
            user.Street = address;
            user.City = city;
            user.Province = province;
            _context.Users.Update(user);
            _context.SaveChanges();

            TempData["SuccessMessage"] = "Cap nhat thanh cong";
            return RedirectToPage("/ViewProfile");
        }

    }
}
