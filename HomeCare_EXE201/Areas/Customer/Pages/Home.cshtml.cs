using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace HomeCare_EXE201.Areas.Customer.Pages
{
    public class HomeModel : PageModel
    {
        public void OnGet()
        {
            Console.WriteLine(" Customer Home");
        }
    }
}
