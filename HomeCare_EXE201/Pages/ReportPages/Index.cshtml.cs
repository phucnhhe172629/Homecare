using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using HomeCare_EXE201.Models;

namespace HomeCare_EXE201.Pages.ReportPages
{
    public class IndexModel : PageModel
    {
        private readonly HomeCare_EXE201.Models.HomeCareExe201Context _context;

        public IndexModel(HomeCare_EXE201.Models.HomeCareExe201Context context)
        {
            _context = context;
        }

        public IList<Report> Report { get;set; } = default!;

        public async Task OnGetAsync()
        {
            Report = await _context.Reports
                .Include(r => r.Booking).ToListAsync();
        }
    }
}
