module Admin::UsersHelper
  def admin_string(user)
    user.admin? ? 'あり' : 'なし'
  end
end
