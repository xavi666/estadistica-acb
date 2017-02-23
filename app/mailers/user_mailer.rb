class UserMailer < ActionMailer::Base
  def test_email(user_id)
    @user = User.find_by_id user_id

    if (@user)
      to = @user.email
      puts @user.email

      puts "----> SEND EMAIL"
      mail(:to => to, :subject => "test email", :from => "xgarcesmarti@gmail.com") do |format|
        puts "--> A"
        format.text(:content_type => "text/plain", :charset => "UTF-8", :content_transfer_encoding => "7bit")
      end
    end
  end
end