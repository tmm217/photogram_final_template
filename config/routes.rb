Rails.application.routes.draw do

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "users", :action => "new_registration_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "users", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "users", :action => "edit_registration_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "users", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "users", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_sessions", :action => "new_session_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_sessions", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_sessions", :action => "destroy_cookies" })
             
  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "users", :action => "new_registration_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "users", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "users", :action => "edit_registration_form" })       
  # UPDATE RECORD
  post("/modify_user/:path_id", { :controller => "users", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "users", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_sessions", :action => "new_session_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_sessions", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_sessions", :action => "destroy_cookies" })
             
  #------------------------------


  # READ
  get("/", {:controller => "users", :action => "index" })
  get("/users", {:controller => "users", :action => "index" })
  get("/users/:path_username", {:controller => "users", :action => "show" })
  get("/users/:path_username/own_photos", {:controller => "users", :action => "own_photos" })
  get("/users/:path_username/liked_photos", {:controller => "users", :action => "liked_photos" })
  get("/users/:path_username/feed", {:controller => "users", :action => "feed" })
  get("/users/:path_username/discover", {:controller => "users", :action => "discover" })
  
  # Routes for the Photo resource:

  # CREATE
  post("/insert_photo", { :controller => "photos", :action => "create" })
          
  # READ
  get("/photos", { :controller => "photos", :action => "index" })
  
  get("/photos/:path_id", { :controller => "photos", :action => "show" })
  
  # UPDATE
  
  post("/modify_photo/:path_id", { :controller => "photos", :action => "update" })
  
  # DELETE
  get("/delete_photo/:path_id", { :controller => "photos", :action => "destroy" })

  #------------------------------

  # Like routes

  # CREATE
  post("/insert_like", {:controller => "likes", :action => "create" })

  # READ
  get("/likes", {:controller => "likes", :action => "index" })
  get("/likes/:path_id", {:controller => "likes", :action => "show" })

  # DELETE
  get("/delete_like/:path_id", {:controller => "likes", :action => "destroy" })
  # Comment routes

  # CREATE
  post("/insert_comment", { :controller => "comments", :action => "create" })


  # Follow Request routes
  post("/insert_follow_request", { :controller => "follow_requests", :action => "create" })

  get("/delete_follow_request/:path_id", { :controller => "follow_requests", :action => "destroy" })

  post("/modify_follow_request/:path_id", { :controller => "follow_requests", :action => "update" })

  # ============
end
