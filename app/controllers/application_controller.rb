class ApplicationController < ActionController::Base
  before_action :set_mobile_format

 private

 def set_mobile_format
   request.format = :mobile if mobile_device?
 end

 def mobile_device?
   request.env['mobvious.device_type'] == :mobile
 end
end
