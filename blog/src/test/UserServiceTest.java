import com.iblog.pojo.User;
import com.iblog.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/springMVC.xml"})
public class UserServiceTest {

    @Resource
    private UserService userService;

    @Test
    public void UserServiceTest() {
        User user = userService.getUserById(1);
        System.out.println(user);
    }
}
