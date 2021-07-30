module ApplicationHelper

    def gravatar_for(user,options={size:80})
        email_address = user.email.downcase
        hash = Digest::MD5.hexdigest(email_address)
        size = options[:size]
        gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=200"
        image_tag(gravatar_url,alt:user.username,class:"rounded mx-auto d-block",id:'gravatar-image')
    end

end
