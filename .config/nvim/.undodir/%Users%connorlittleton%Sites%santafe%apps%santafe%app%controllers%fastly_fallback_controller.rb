Vim�UnDo� �{K�!�8�#�.�Aʶ�k����2��zg�   �           :      -       -   -   -    gl��    _�                     �       ����                                                                                                                                                                                                                                                                                                                                                             gl:;     �   �   �   �        def render_404�   �   �   �        �   �   �   �    5��    �                      �                     �    �                      �                     �    �                     �                     �    �                     �                     �    �                                           �    �                     �                     �    �                     �                     �    �                     �                     �    �                     �                     �    �   
                  �                     �    �   	                  �                     �    �                     �                     �    �                     �                     �    �                 
   �             
       �    �          
          �      
              �    �                 
   �             
       �    �                                         �    �                                          5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             gl:A     �   �   �   �          �   �   �   �    5��    �                                           �    �                                         5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             gl:�     �   �   �   �          redirect_to  sg5��    �                                          5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             gl:�     �   �   �   �          redirect_to  5��    �                                          5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             gl:�     �   �   �   �          redirect_to  ''5��    �                                          5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             gl:�    �   �   �   �          redirect_to ''5��    �                                          5�_�                    �        ����                                                                                                                                                                                                                                                                                                                            �          �          V       gl;�     �   �   �   �    �   �   �   �    �   �   �            def render_404       redirect_to '/404'     end5��    �                      �      .               �    �                      �              �       5�_�      	              �       ����                                                                                                                                                                                                                                                                                                                            �           �          V       gl;�     �   �   �          S      render 'guest/not_found', layout: 'guest', status: :not_found, formats: :html5��    �                      J      T               5�_�      
           	   �       ����                                                                                                                                                                                                                                                                                                                            �           �          V       gl;�     �   �   �   �    �   �   �   �    5��    �                                    T       5�_�   	              
   �       ����                                                                                                                                                                                                                                                                                                                            �          �          V       gl;�     �   �   �              if ajax_request?   )      render json: {}, status: :not_found       else5��    �                      V      H               5�_�   
                 �       ����                                                                                                                                                                                                                                                                                                                            �          �          V       gl;�     �   �   �              end5��    �                      V                     5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �          �          V       gl;�    �   �   �   �      S      render 'guest/not_found', layout: 'guest', status: :not_found, formats: :html5��    �                                         5�_�                    �        ����                                                                                                                                                                                                                                                                                                                                                             gl@     �   �   �   �    �   �   �   �    5��    �                      Z              h       5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             gl@     �   �   �   �    5��    �                      Z                     �    �                     [                     �    �                      Z                     5�_�                    �   #    ����                                                                                                                                                                                                                                                                                                                                                             gl@    �   �   �   �      K    vars_for_js(experimenter_vars: experimenter.get_experiment_assignments)5��    �   #                 �                    �    �   '                  �                     �    �   &                  �                     �    �   %                  �                     �    �   $                  �                     �    �   #                 �                    �    �   #                 �                    �    �   #                 �                    5�_�                          ����                                                                                                                                                                                                                                                                                                                                                             gl@�     �         �    �         �    5��                          f              D       5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             gl@�     �         �      C  before_action :override_experimenter, :turn_off_pageview_tracking5��                        w                    �                         y                     �                         x                     �                        w                    �                        w                    �                        w                    5�_�                       #    ����                                                                                                                                                                                                                                                                                                                                                             gl@�     �         �      =  before_action :set_vars_for_js, :turn_off_pageview_tracking5��       #                  �                     �       "                  �                     5�_�                       "    ����                                                                                                                                                                                                                                                                                                                                                             gl@�     �         �      "  before_action :set_vars_for_js, 5��       "                  �                     5�_�                       #    ����                                                                                                                                                                                                                                                                                                                                                             gl@�     �         �      $  before_action :set_vars_for_js, []5��       #                  �                     �       .                  �                     �       -                  �                     �       ,                  �                     �       +                  �                     �       *                  �                     �       )              
   �             
       �       )       
          �      
              �       )              
   �             
       5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             gl@�     �         �    �         �    5��                          �              9       5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             gl@�     �         �      8  before_action :admin_required, only: [:form_documents]5��                        �                    �                         �                     �                         �                     �                         �                     �                         �                     �                        �                    �                        �                    �                        �                    5�_�                       *    ����                                                                                                                                                                                                                                                                                                                                                             gl@�     �         �      9  before_action :set_vars_for_js, only: [:form_documents]5��       *                 �                    �       /                  �                     �       .                  �                     �       -                  �                     �       ,                  �                     �       +                  �                     �       *              
   �             
       �       *       
          �      
              �       *              
   �             
       5�_�                       3    ����                                                                                                                                                                                                                                                                                                                                                             gl@�    �                4  before_action :set_vars_for_js, [:only render_404]5��                          f      5               5�_�                       3    ����                                                                                                                                                                                                                                                                                                                                                             gl@�     �                5  before_action :set_vars_for_js, only: [:render_404]5��                          f      6               5�_�                       3    ����                                                                                                                                                                                                                                                                                                                                                             gl@�     �         �    �         �    5��                          �              6       5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             gl@�     �                5  before_action :set_vars_for_js, only: [:render_404]5��                          �      6               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             gl@�    �         �    �         �    5��                          f              6       5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             glA-     �   �   �   �          �   �   �   �    5��    �                      �                     �    �                  	   �             	       5�_�                     �   	    ����                                                                                                                                                                                                                                                                                                                                                             glA.     �   �   �   �      	    puts 5��    �   	                  �                     5�_�      !               �   
    ����                                                                                                                                                                                                                                                                                                                                                             glA/    �   �   �   �          puts ''5��    �   
                  �                     �    �                     �                     �    �                     �                     �    �                    �                    �    �                    �                    �    �                    �                    5�_�       "           !   �       ����                                                                                                                                                                                                                                                                                                                                                             glA�     �   �   �   �    �   �   �   �    5��    �                      8              )       5�_�   !   #           "   �       ����                                                                                                                                                                                                                                                                                                                                                             glA�    �   �   �   �      (    puts 'CALLING LOCAL set_vars_for_js'5��    �                    P                    �    �                     U                     �    �                     T                     �    �                     S                     �    �                     R                     �    �                     Q                     �    �                 
   P             
       �    �          
          P      
              �    �                 
   P             
       5�_�   "   %           #      !    ����                                                                                                                                                                                                                                                                                                                                                             glA�     �                5  before_action :set_vars_for_js, only: [:render_404]5��                          f      6               5�_�   #   &   $       %   �   !    ����                                                                                                                                                                                                                                                                                                                                                             glA�   
 �   �   �   �          �   �   �   �    5��    �                      &                     �    �                     *                     �    �   	                  /                     �    �                     .                     �    �                     -                     �    �                     ,                     �    �                     +                     �    �                    *                    �    �                    *                    �    �                    *                    5�_�   %   '           &   �   :    ����                                                                                                                                                                                                                                                                                                                                                             glr    �   �   �   �      U    vars_for_js(experimenter_vars: marketing_experimenter.get_experiment_assignments)5��    �   :              	                	       �    �   A                                     5�_�   &   (           '   �   :    ����                                                                                                                                                                                                                                                                                                                            �   :       �   O       v   O    glr7    �   �   �   �      Q    vars_for_js(experimenter_vars: marketing_experimenter.get_experiment_variant)�   �   �   �    5��    �   :                                     5�_�   '   )           (   �       ����                                                                                                                                                                                                                                                                                                                            �   !       �   !       V   !    glr�     �   �   �   �    �   �   �   �    5��    �                      �              h       5�_�   (   *           )   �       ����                                                                                                                                                                                                                                                                                                                            �   !       �   !       V   !    gls<     �   �   �          (    puts 'CALLING LOCAL set_vars_for_js'5��    �                      �      )               5�_�   )   +           *   �       ����                                                                                                                                                                                                                                                                                                                            �   !       �   !       V   !    gls>    �   �   �          #    puts 'CALLING LOCAL render_404'5��    �                            $               5�_�   *   ,           +   �       ����                                                                                                                                                                                                                                                                                                                            �          �          V       glsD    �   �   �            def set_vars_for_js   K    vars_for_js(experimenter_vars: experimenter.get_experiment_assignments)     end5��    �                      �      h               5�_�   +   -           ,   �       ����                                                                                                                                                                                                                                                                                                                            �          �          V       glug     �               �   6class FastlyFallbackController < ApplicationController   <  # These routes are only hit in production for two reasons:   '  # 1. We are experimenting on a route.   F  # 2. Fastly is down and we are rerouting traffic to our data center.     #   [  # The purpose of these controller actions is to serve the html file that will be rendered   q  # in the browser client, with followup requests being made for static assets (/_next/, /next/) which are served   q  # directly from S3 in nginx (https://stash.wlth.fr/projects/COOK/repos/wf_frontend/pull-requests/214/overview).     #   z  # We also use these controller actions for development purposes. Proxying rails helps create a more seamless environment   z  # between logged-in and logged-out pages. When creating new marketing pages, you should always create a new action here.       C  before_action :override_experimenter, :turn_off_pageview_tracking   :  skip_after_action :set_e2e_variant_overrides_if_e2e_test         def homepage   W    if marketing_experimenter.experiment_enabled?('web_aqua_sp_500_di_marketing_pages')   a      if marketing_experimenter.experiment_enabled?('aqua_web_sp500_di_homepage_banner_20241215')   5        render_nextjs('index-sp500di-banner-enabled')   
      else   .        render_nextjs('index-sp500di-enabled')   	      end       else         render_nextjs('index')       end     end         def sp500_direct   W    if marketing_experimenter.experiment_enabled?('web_aqua_sp_500_di_marketing_pages')   #      render_nextjs('sp500-direct')       else         render_404       end     end       
  def cash       render_nextjs('cash')     end         def investing       render_nextjs('investing')     end       $  def socially_responsible_investing   3    render_nextjs('socially-responsible-investing')     end         def pricing       render_nextjs('pricing')     end         def retirement       render_nextjs('retirement')     end         def reviews       render_nextjs('reviews')     end         def stock_investing   $    render_nextjs('stock-investing')     end         def historical_performance   +    render_nextjs('historical-performance')     end         def tax_loss_harvesting   (    render_nextjs('tax-loss-harvesting')     end         def ploc_landing   -    render_nextjs('portfolio-line-of-credit')     end         def risk_questionnaire   '    render_nextjs('risk-questionnaire')     end         def risk_questionnaire_quiz   ,    render_nextjs('risk-questionnaire/quiz')     end       &  def risk_questionnaire_quiz_takeaway   5    render_nextjs('risk-questionnaire/quiz/takeaway')     end          def coworker_referrals_rewards   g    if marketing_experimenter.experiment_enabled?('growth_web_coworker_pilot_v2_landing_page_20231107')   )      company = params[:company].downcase   )      if !company.end_with?("-coworkers")   �        return redirect_to action: 'coworker_referrals_rewards', company: "#{company}-coworkers", affiliate_id: params[:affiliate_id]   	      end         begin   +        render_nextjs("rewards/#{company}")   7      rescue ActionView::MissingTemplate, ArgumentError   U        event_publisher.track_event('coworker-reward-lp', 'invalid-company', company)   &        redirect_to action: 'homepage'   	      end       else         render_404       end     end         def automated_bond_portfolio   -    render_nextjs('automated-bond-portfolio')     end         def automated_bond_ladder   *    render_nextjs('automated-bond-ladder')     end       I  # To be used when we want to share a development page with other teams.   
  def test   `    if Rails.env.development? || Rails.env.test? || request.canary? || request.integration_test?         render_nextjs('index')       else         render_404       end     end         def cotrustee_review   %    render_nextjs('cotrustee-review')     end         def invite_disclosure   d    if marketing_experimenter.experiment_enabled?('growth_web_compliance_incentive_design_20240903')   (      redirect_to promotional_terms_path       else   .      render_nextjs('legal/invite-disclosure')       end     end         def college       render_nextjs('college')     end         def sitemap       render_nextjs('sitemap')     end         def cash_boost       render_nextjs('cash-boost')     end         def perks   '    company = params[:company].downcase   �    if marketing_experimenter.experiment_enabled?('growth_web_amazon_perks_landing_page_20240729') && !company.end_with?("-redesign")   `      if marketing_experimenter.experiment_enabled?('growth_web_amazon_investing_perk_20241112')           begin   4          render_nextjs("perks/#{company}-redesign")   9        rescue ActionView::MissingTemplate, ArgumentError   M          event_publisher.track_event('perks-lp', 'invalid-company', company)             render_404           end   
      else           begin   +          render_nextjs("perks/#{company}")   9        rescue ActionView::MissingTemplate, ArgumentError   M          event_publisher.track_event('perks-lp', 'invalid-company', company)             render_404           end   	      end       else         render_404       end     end         def global_messages       render json: {         enableBanner: false,         message:   o        'We’re performing scheduled maintenance on <START_TIME>. We expect service to return at <END_TIME>.',       }     end         def marketing_experimenter       @marketing_experimenter ||= MarketingExperimenter.new(@tracking_token, cookies[ExperimentsHelper::E2E_OVERRIDE_COOKIE_KEY])     end       	  private         def render_404       set_vars_for_js   Q    render 'guest/not_found', layout: 'guest', status: :not_found, formats: :html     end         def set_vars_for_js   U    vars_for_js(experimenter_vars: marketing_experimenter.get_experiment_assignments)     end         class NoOpExperimenter   $    #   Use `marketing_experimenter`     end         def override_experimenter   $    @experimenter = NoOpExperimenter     end   end5�5�_�   ,               -   �       ����                                                                                                                                                                                                                                                                                                                            �          �          V       gl��     �               �   6class FastlyFallbackController < ApplicationController   <  # These routes are only hit in production for two reasons:   '  # 1. We are experimenting on a route.   F  # 2. Fastly is down and we are rerouting traffic to our data center.     #   [  # The purpose of these controller actions is to serve the html file that will be rendered   q  # in the browser client, with followup requests being made for static assets (/_next/, /next/) which are served   q  # directly from S3 in nginx (https://stash.wlth.fr/projects/COOK/repos/wf_frontend/pull-requests/214/overview).     #   z  # We also use these controller actions for development purposes. Proxying rails helps create a more seamless environment   z  # between logged-in and logged-out pages. When creating new marketing pages, you should always create a new action here.       C  before_action :override_experimenter, :turn_off_pageview_tracking   :  skip_after_action :set_e2e_variant_overrides_if_e2e_test         def homepage   W    if marketing_experimenter.experiment_enabled?('web_aqua_sp_500_di_marketing_pages')   a      if marketing_experimenter.experiment_enabled?('aqua_web_sp500_di_homepage_banner_20241215')   5        render_nextjs('index-sp500di-banner-enabled')   
      else   .        render_nextjs('index-sp500di-enabled')   	      end       else         render_nextjs('index')       end     end         def sp500_direct   W    if marketing_experimenter.experiment_enabled?('web_aqua_sp_500_di_marketing_pages')   #      render_nextjs('sp500-direct')       else         render_404       end     end       
  def cash       render_nextjs('cash')     end         def investing       render_nextjs('investing')     end       $  def socially_responsible_investing   3    render_nextjs('socially-responsible-investing')     end         def pricing       render_nextjs('pricing')     end         def retirement       render_nextjs('retirement')     end         def reviews       render_nextjs('reviews')     end         def stock_investing   $    render_nextjs('stock-investing')     end         def historical_performance   +    render_nextjs('historical-performance')     end         def tax_loss_harvesting   (    render_nextjs('tax-loss-harvesting')     end         def ploc_landing   -    render_nextjs('portfolio-line-of-credit')     end         def risk_questionnaire   '    render_nextjs('risk-questionnaire')     end         def risk_questionnaire_quiz   ,    render_nextjs('risk-questionnaire/quiz')     end       &  def risk_questionnaire_quiz_takeaway   5    render_nextjs('risk-questionnaire/quiz/takeaway')     end          def coworker_referrals_rewards   g    if marketing_experimenter.experiment_enabled?('growth_web_coworker_pilot_v2_landing_page_20231107')   )      company = params[:company].downcase   )      if !company.end_with?("-coworkers")   �        return redirect_to action: 'coworker_referrals_rewards', company: "#{company}-coworkers", affiliate_id: params[:affiliate_id]   	      end         begin   +        render_nextjs("rewards/#{company}")   7      rescue ActionView::MissingTemplate, ArgumentError   U        event_publisher.track_event('coworker-reward-lp', 'invalid-company', company)   &        redirect_to action: 'homepage'   	      end       else         render_404       end     end         def automated_bond_portfolio   -    render_nextjs('automated-bond-portfolio')     end         def automated_bond_ladder   *    render_nextjs('automated-bond-ladder')     end       I  # To be used when we want to share a development page with other teams.   
  def test   `    if Rails.env.development? || Rails.env.test? || request.canary? || request.integration_test?         render_nextjs('index')       else         render_404       end     end         def cotrustee_review   %    render_nextjs('cotrustee-review')     end         def invite_disclosure   d    if marketing_experimenter.experiment_enabled?('growth_web_compliance_incentive_design_20240903')   (      redirect_to promotional_terms_path       else   .      render_nextjs('legal/invite-disclosure')       end     end         def college       render_nextjs('college')     end         def sitemap       render_nextjs('sitemap')     end         def cash_boost       render_nextjs('cash-boost')     end         def perks   '    company = params[:company].downcase   �    if marketing_experimenter.experiment_enabled?('growth_web_amazon_perks_landing_page_20240729') && !company.end_with?("-redesign")   `      if marketing_experimenter.experiment_enabled?('growth_web_amazon_investing_perk_20241112')           begin   4          render_nextjs("perks/#{company}-redesign")   9        rescue ActionView::MissingTemplate, ArgumentError   M          event_publisher.track_event('perks-lp', 'invalid-company', company)             render_404           end   
      else           begin   +          render_nextjs("perks/#{company}")   9        rescue ActionView::MissingTemplate, ArgumentError   M          event_publisher.track_event('perks-lp', 'invalid-company', company)             render_404           end   	      end       else         render_404       end     end         def global_messages       render json: {         enableBanner: false,         message:   o        'We’re performing scheduled maintenance on <START_TIME>. We expect service to return at <END_TIME>.',       }     end         def marketing_experimenter       @marketing_experimenter ||= MarketingExperimenter.new(@tracking_token, cookies[ExperimentsHelper::E2E_OVERRIDE_COOKIE_KEY])     end       	  private         def render_404       set_vars_for_js   Q    render 'guest/not_found', layout: 'guest', status: :not_found, formats: :html     end         def set_vars_for_js   U    vars_for_js(experimenter_vars: marketing_experimenter.get_experiment_assignments)     end         class NoOpExperimenter   $    #   Use `marketing_experimenter`     end         def override_experimenter   $    @experimenter = NoOpExperimenter     end   end5�5�_�   #           %   $   �   !    ����                                                                                                                                                                                                                                                                                                                                                             glA�     �   �   �        5��    �                      �      )               5�_�                    �   :    ����                                                                                                                                                                                                                                                                                                                                                             gl@     �   �   �   �      ;    vars_for_js(experimenter_vars: marketing_experimenter.)5��    �   9                 �                    5��