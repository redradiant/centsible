class SpreeOmniHooks < Spree::ThemeSupport::HookListener
  insert_before :signup do
    %(<%= render :partial => 'shared/social_auth'%>)
  end
  insert_before :login do
    %(<%= render :partial => 'shared/social_auth'%>)
  end
end
