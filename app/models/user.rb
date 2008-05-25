require 'digest/sha1'

class User < ActiveRecord::Base
  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken

  # Useful has_many :through info:
  # http://paulbarry.com/articles/2007/10/24/has_many-through-checkboxes
  # http://blog.hasmanythrough.com/2006/2/28/association-goodness
  has_many :user_skills, :dependent => :destroy
  has_many :skills, :through => :user_skills

  attr_accessor :skill_ids
  after_save :update_skills

  validates_presence_of     :login
  validates_length_of       :login,    :within => 3..40
  validates_uniqueness_of   :login,    :case_sensitive => false
  validates_format_of       :login,    :with => RE_LOGIN_OK, :message => MSG_LOGIN_BAD

  validates_format_of       :name,     :with => RE_NAME_OK,  :message => MSG_NAME_BAD, :allow_nil => true
  validates_length_of       :name,     :maximum => 100

  validates_presence_of     :email
  validates_length_of       :email,    :within => 6..100 #r@a.wk
  validates_uniqueness_of   :email,    :case_sensitive => false
  validates_format_of       :email,    :with => RE_EMAIL_OK, :message => MSG_EMAIL_BAD

  

  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :email, :name, 
                  :url, :buzzwords, :skill_ids, 
                  :password, :password_confirmation



  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  #
  # uff.  this is really an authorization, not authentication routine.  
  # We really need a Dispatch Chain here or something.
  # This will also let us return a human error message.
  #
  def self.authenticate(login, password)
    u = find_by_login(login) # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  protected
    
  def update_skills
    unless skill_ids.nil?
      self.user_skills.each do |us|
        us.destroy unless user_skills.include?(us.skill_id.to_s)
        skill_ids.delete(us.skill_id.to_s)
      end
      skill_ids.each do |s|
        self.user_skills.create(:skill_id => s) unless s.blank?
      end
      reload
      self.skill_ids = nil
    end
  end

end
