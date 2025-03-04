using HomeCare_EXE201.Models;
using Microsoft.AspNetCore.Identity;
using Org.BouncyCastle.Utilities;


namespace HomeCare_EXE201.Service
{
    public interface IUserService
    {
        User GetCurrentUser();
    }
    public class UserService : IUserService
    {
        private readonly HomeCareExe201Context _context;
        private readonly IHttpContextAccessor _contextAccessor;
        private readonly UserManager<User> _userManager;
        


        public UserService(HomeCareExe201Context context, IHttpContextAccessor contextAccessor, UserManager<User> userManager)
        {
            _context = context;
            _contextAccessor = contextAccessor;
            _userManager = userManager;
        }

        public User GetCurrentUser()
        {

            var customerId = _userManager.GetUserId(_contextAccessor.HttpContext.User);
           
            return _context.Users.FirstOrDefault(x => x.Id == Int32.Parse(customerId));
        }
    }
}
