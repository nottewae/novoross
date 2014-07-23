class Admin < ActiveRecord::Base
  before_create :make_password
  def make_password
    self.salt=Digest::SHA2.hexdigest(Time.now.to_i.to_s+"Смерть бендере!").to_s
    self.password=Digest::SHA2.hexdigest(self.password+"==>"+self.salt).to_s
  end
  def auth(email,password)
    admin=Admin.find_by_email(email)
    admin ? (admin.password== Digest::SHA2.hexdigest(password+"==>"+admin.salt).to_s ? admin : nil) : nil


  end
end
