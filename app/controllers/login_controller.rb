class LoginController < ApplicationController

def index
    @login = Login.all 
end

end
