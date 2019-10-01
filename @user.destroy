
[1mFrom:[0m /home/ec2-user/environment/bookstocks/app/controllers/admin/users_controller.rb @ line 14 Admin::UsersController#destroy:

     [1;34m9[0m: [32mdef[0m [1;34mdestroy[0m
    [1;34m10[0m:   @user = [1;34;4mUser[0m.find(params[[33m:id[0m])
    [1;34m11[0m: 
    [1;34m12[0m:   @user.transaction [32mdo[0m
    [1;34m13[0m:     binding.pry
 => [1;34m14[0m:     @user.destroy!
    [1;34m15[0m:     @user.posts.destroy!
    [1;34m16[0m:     @user.favorites.destroy!
    [1;34m17[0m:     @user.searches.destroy!
    [1;34m18[0m:   [32mend[0m
    [1;34m19[0m:   
    [1;34m20[0m:   flash[[33m:success[0m] = [31m[1;31m"[0m[31mユーザーを削除しました[1;31m"[0m[31m[0m
    [1;34m21[0m:   redirect_to admin_users_path
    [1;34m22[0m:   
    [1;34m23[0m:   [32mrescue[0m => e
    [1;34m24[0m:     flash[[33m:danger[0m] = [31m[1;31m"[0m[31mユーザーの削除に失敗しました[1;31m"[0m[31m[0m
    [1;34m25[0m:     redirect_to admin_users_path
    [1;34m26[0m: [32mend[0m

