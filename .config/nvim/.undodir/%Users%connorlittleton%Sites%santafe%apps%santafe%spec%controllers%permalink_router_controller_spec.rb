Vim�UnDo� ��0H��;� �ar�(|�H�kàȨg�x�0-%  �           (                       g~D    _�                    �       ����                                                                                                                                                                                                                                                                                                                           I         �          V       g}��     �  �  �  �    5��    �                     �?                     �    �                    �?                     �    �  
                  �?                     �    �  	                  �?                     �    �                    �?                     �    �                    �?                     �    �                    �?                     �    �                    �?                     �    �                    �?                     �    �                    �?                     �    �                    �?                     �    �                    �?                     �    �                     �?                     5�_�                   �       ����                                                                                                                                                                                                                                                                                                                           �         �          V       g}��     �  �  �  �    �  �  �  �    5��    �                     �?              t      5�_�                   �       ����                                                                                                                                                                                                                                                                                                                           �         �          V       g}��     �  �  �  �    5��    �                     �?                     �    �                    �?                     �    �  
                  �?                     �    �  	                  �?                     �    �                    �?                     �    �                    �?                     �    �                    �?                     �    �                    �?                     �    �                    �?                     �    �                    �?                     �    �                    �?                     �    �                    �?                     �    �                     �?                     5�_�                   �   2    ����                                                                                                                                                                                                                                                                                                                           �         �          V       g}��     �  �  �  �      p            context 'when the external account id does not exist in get_customer_accounts_by_user_id results' do5��    �  2       :          @      :              5�_�                   �       ����                                                                                                                                                                                                                                                                                                                           �         �          V       g}�
    �  �  �  �      0              let(:id) { 'ACCC-YCUC-5AX2-0000' }�  �  �  �    �  �  �  �    5��    �                   :@                    5�_�                   �   (    ����                                                                                                                                                                                                                                                                                                                           �         �          V       g}�     �  �  �  �      ,                expect(permalink).to eq(nil)5��    �  (                 �@                    5�_�                   �   (    ����                                                                                                                                                                                                                                                                                                                           �         �          V       g}��    �  �  �  �      /                expect(permalink).to eq(ifalse)5��    �  (                 �@                    5�_�      	             �        ����                                                                                                                                                                                                                                                                                                                           �         �           V   ,    g}��     �  �  �       	       B            context 'when the external account id is not valid' do                  let(:id) { '%25' }       '              it 'should return nil' do   Y                permalink = controller.send('get_permalink', 'account-update-risk-score')   .                expect(permalink).to eq(false)                 end               end5��    �      	               �?      9              5�_�      
           	  U        ����                                                                                                                                                                                                                                                                                                                           �         �           V   ,    g}��     �  U  _  �    �  U  V  �    5��    U              	       M6              9      5�_�   	              
  W        ����                                                                                                                                                                                                                                                                                                                           W          ^           V        g}��     �  V  _  �      B            context 'when the external account id is not valid' do                  let(:id) { '%25' }       '              it 'should return nil' do   Y                permalink = controller.send('get_permalink', 'account-update-risk-score')   .                expect(permalink).to eq(false)                 end               end5��    V                 
   N6             
       �    W                    �6                    �    Y                    �6                    �    Z                    �6                    �    [                    -7                    �    \                    Z7                    �    ]                 
   j7             
       5�_�   
                W        ����                                                                                                                                                                                                                                                                                                                           W          ^           V        g}��     �  V  _  �      @          context 'when the external account id is not valid' do               let(:id) { '%25' }       %            it 'should return nil' do   W              permalink = controller.send('get_permalink', 'account-update-risk-score')   ,              expect(permalink).to eq(false)               end             end5��    V          
          N6      
              �    W                 
   �6             
       �    Y                 
   �6             
       �    Z                    �6                    �    [                    %7                    �    \                 
   P7             
       �    ]          
          ^7      
              5�_�                   �        ����                                                                                                                                                                                                                                                                                                                           W          ^           V        g}��    �  �  �           5��    �                     �@                     5�_�                    W        ����                                                                                                                                                                                                                                                                                                                           W          ^           V        g~C     �              �   require 'spec_helper'       %describe PermalinkRouterController do   '  let(:action_string) { 'test-please' }   5  let(:original_parameters) { { 'hello' => 'moto' } }   '  let(:user) { User.new_mock(id: 123) }         before(:each) do       stub_services!       login_as(user)     end         context '#reroute' do   h    it 'should call reroute with the return value of the action and params without :permalink_action' do         action_val = true   4      route = send('plan_path', original_parameters)   U      controller.expects(:get_permalink).with(action_string).returns(action_val).once   ^      controller.expects(:get_route).with(action_val, original_parameters).returns(route).once       V      get :reroute, params: original_parameters.merge(permalink_action: action_string)   (      expect(response.status).to eq(302)       end       t    it 'should call reroute without the return value of action false if get_route is given a non-existent action' do   *      stub_time_date!('00:00', '2/6/2015')         action_val = false   U      controller.expects(:get_permalink).with(action_string).returns(action_val).once       V      get :reroute, params: original_parameters.merge(permalink_action: action_string)   #      should_have_experimenter_vars   (      expect(response.status).to eq(404)       end     end         context '#get_route' do        let(:perma_broken) { false }   4    let(:perma_basic) { PermaLink.new('plan_path') }       let(:perma_with_opts) do   g      PermaLink.new('plan_path', { required_parameters: [:req], additional_parameters: { add: true } })       end       Q    it 'should take an action and return the path helper if action isnt false' do   t      expect(controller.send('get_route', perma_basic, ActiveSupport::HashWithIndifferentAccess.new)).to eq('/plan')       end       ^    it 'should take an action with options and return the path helper if action isnt false' do         expect(   s        controller.send('get_route', perma_with_opts, ActiveSupport::HashWithIndifferentAccess.new('req' => true)),   (      ).to eq('/plan?add=true&req=true')       end       0    it 'should return nil if action is false' do   q      expect(controller.send('get_route', perma_broken, ActiveSupport::HashWithIndifferentAccess.new)).to eq(nil)       end       .    it 'should handle required path params' do   O      permalink = PermaLink.new('saved_plan_path', required_parameters: [:spi])   Y      query_params = ActiveSupport::HashWithIndifferentAccess.new('spi' => 'foo-bar-bar')   d      expect(controller.send('get_route', permalink, query_params)).to eq('/saved-plan/foo-bar-bar')       end     end       (  context '#has_required_parameters?' do   b    it 'should return boolean true if the required keys exist even if there are other keys too' do   r      expect(controller.send('has_required_parameters?', { spi: 'spi_kids', spa: 'footrub' }, [:spi])).to eq(true)       end       g    it 'should return false if the params hash is missing any of the required params from the array' do   b      expect(controller.send('has_required_parameters?', { spa: 'footrub' }, [:spi])).to eq(false)       end       K    it 'should return true given an empty array with a given any action' do   ]      expect(controller.send('has_required_parameters?', { spa: 'footrub' }, [])).to eq(true)       end     end         context '#get_permalink' do   [    it 'should take a given action and reroute with an assoicated PermaLink child class' do   @      permalink = controller.send('get_permalink', 'saved-plan')   5      expect(permalink.path).to eq('saved_plan_path')   9      expect(permalink.required_parameters).to eq([:spi])       end       [    it 'should take a given action and reroute with an assoicated PermaLink child class' do   M      expect(controller.send('get_permalink', 'this-aint-real')).to eq(false)       end       f    context 'all invidual routes with requirements. DO NOT CHANGE unless aware of all consequences' do   %      it 'turbotax-direct-deposit' do   O        permalink = controller.send('get_permalink', 'turbotax-direct-deposit')   @        expect(permalink.path).to eq('fund_direct_deposit_path')   	      end             it 'transactions' do   D        permalink = controller.send('get_permalink', 'transactions')   9        expect(permalink.path).to eq('transactions_path')   B        expect(permalink.required_parameters).to eq([:account_id])   	      end             it 'saved-plan' do   B        permalink = controller.send('get_permalink', 'saved-plan')   7        expect(permalink.path).to eq('saved_plan_path')   ;        expect(permalink.required_parameters).to eq([:spi])   	      end       "      it 'selling-plan-tell-us' do   L        permalink = controller.send('get_permalink', 'selling-plan-tell-us')   5        expect(permalink.path).to eq('homepage_path')   	      end              it 'confirm-withdrawal' do   J        permalink = controller.send('get_permalink', 'confirm-withdrawal')   ?        expect(permalink.path).to eq('confirm_withdrawal_path')   q        expect(permalink.required_parameters).to eq([:account_id, controller.class::WITHDRAWAL_TOKEN_BANK_PARAM])   	      end             it 'settings' do   @        permalink = controller.send('get_permalink', 'settings')   5        expect(permalink.path).to eq('settings_path')   	      end             it 'wftw-validation' do   G        permalink = controller.send('get_permalink', 'wftw-validation')   <        expect(permalink.path).to eq('wftw_validation_path')   F        expect(permalink.required_parameters).to eq([:address, :hash])   	      end             it 'settings-wftw' do   E        permalink = controller.send('get_permalink', 'settings-wftw')   :        expect(permalink.path).to eq('settings_wftw_path')   7        expect(permalink.required_parameters).to eq([])   	      end             it 'account-summary' do   G        permalink = controller.send('get_permalink', 'account-summary')   4        expect(permalink.path).to eq('account_path')   B        expect(permalink.required_parameters).to eq([:account_id])   	      end             it 'statements' do   B        permalink = controller.send('get_permalink', 'statements')   6        expect(permalink.path).to eq('documents_path')   	      end             it 'loan-repayment' do   F        permalink = controller.send('get_permalink', 'loan-repayment')   ;        expect(permalink.path).to eq('loan_repayment_path')   A        expect(permalink.required_parameters).to eq([:accountId])   	      end       (      it 'spousal-link-approval-form' do   R        permalink = controller.send('get_permalink', 'spousal-link-approval-form')   G        expect(permalink.path).to eq('spousal_link_approval_form_path')   O        expect(permalink.required_parameters).to eq([:externalized_request_id])   	      end             it 'faq' do   ;        permalink = controller.send('get_permalink', 'faq')   0        expect(permalink.path).to eq('faq_path')   	      end       (      it 'transfer-account-selection' do   R        permalink = controller.send('get_permalink', 'transfer-account-selection')   G        expect(permalink.path).to eq('transfer_account_selection_path')   I        expect(permalink.required_parameters).to eq([:externalAccountId])   	      end             it 'fund-bank' do   A        permalink = controller.send('get_permalink', 'fund-bank')   6        expect(permalink.path).to eq('fund_bank_path')   	      end             it 'validate-email' do   F        permalink = controller.send('get_permalink', 'validate-email')   ;        expect(permalink.path).to eq('validate_email_path')   	      end             it 'tier-selection' do   F        permalink = controller.send('get_permalink', 'tier-selection')   D        expect(permalink.path).to eq('flow_tlh_tier_selection_path')   A        expect(permalink.required_parameters).to eq([:accountId])   	      end             it 'trusted-contact' do   G        permalink = controller.send('get_permalink', 'trusted-contact')   >        expect(permalink.path).to eq('settings_security_path')   S        expect(permalink.additional_parameters).to eq({ anchor: 'trustedcontact' })   	      end              it 'cash-merch-account' do   J        permalink = controller.send('get_permalink', 'cash-merch-account')   E        expect(permalink.path).to eq('application_account_type_path')   D        expect(permalink.required_parameters).to eq([:account_type])   	      end       +      context 'bond-ladder-introduction' do   /        it 'routes correctly when logged in' do   R          permalink = controller.send('get_permalink', 'bond-ladder-introduction')   L          expect(permalink.path).to eq('application_bond_ladder_intro_path')   O          expect(permalink.additional_parameters).to eq({ to: nil, from: nil })           end       0        it 'routes correctly when logged out' do             login_as(nil)   R          permalink = controller.send('get_permalink', 'bond-ladder-introduction')   F          expect(permalink.path).to eq('start_bond_ladder_intro_path')   O          expect(permalink.additional_parameters).to eq({ to: nil, from: nil })           end   	      end       &      context 'sp-500-introduction' do            it 'routes correctly' do   M          permalink = controller.send('get_permalink', 'sp-500-introduction')   J          expect(permalink.path).to eq('application_sp_500_di_intro_path')           end   	      end       *      context 'sp-500-new-introduction' do   /        it 'routes correctly when logged in' do   Q          permalink = controller.send('get_permalink', 'sp-500-new-introduction')   J          expect(permalink.path).to eq('application_sp_500_di_intro_path')           end       0        it 'routes correctly when logged out' do             login_as(nil)   Q          permalink = controller.send('get_permalink', 'sp-500-new-introduction')   D          expect(permalink.path).to eq('start_sp_500_di_intro_path')           end   	      end       %      context 'cost-basis-details' do   =        before(:each) { controller.params[:account_id] = id }       "        context 'without an id' do             let(:id) { '' }       %          it 'should return false' do   N            permalink = controller.send('get_permalink', 'cost-basis-details')   *            expect(permalink).to eq(false)             end           end       '        context 'with an account id' do   ,          let(:id) { 'ACCC-4CXU-YY10-YN9I' }       O          it 'converts the id to an internal account id redirects correctly' do   N            permalink = controller.send('get_permalink', 'cost-basis-details')   K            expect(permalink.path).to eq('account_cost_basis_details_path')   P            expect(permalink.additional_parameters).to eq({ account_id: 40297 })             end           end   	      end       -      context 'joint-access/invite-accept' do   L        before(:each) { controller.params[:invite_token] = 'example-token' }       /        it 'routes correctly when logged in' do   T          permalink = controller.send('get_permalink', 'joint-access/invite-accept')   _          expect(permalink.path).to eq('joint_access_secondary_accept_email_confirmation_path')   Z          expect(permalink.additional_parameters).to eq({ invite_token: 'example-token' })           end       0        it 'routes correctly when logged out' do             login_as(nil)   T          permalink = controller.send('get_permalink', 'joint-access/invite-accept')   U          expect(permalink.path).to eq('joint_access_secondary_accept_new_user_path')   Z          expect(permalink.additional_parameters).to eq({ invite_token: 'example-token' })           end   	      end              context 'beneficiaries' do   <        before(:each) { controller.params[:accountId] = id }   0        context 'with an internal account id' do             let(:id) { '1234' }       Y          before(:each) { user_service.expects(:get_customer_accounts_by_user_id).never }       5          it 'sets additional parameter as the id' do   I            permalink = controller.send('get_permalink', 'beneficiaries')   A            expect(permalink.path).to eq('settings_account_path')   E            expect(permalink.required_parameters).to eq([:accountId])   i            expect(permalink.additional_parameters).to eq({ accountId: '1234', anchor: 'beneficiaries' })             end           end       0        context 'with an external account id' do   )          context 'when not logged in' do   .            let(:id) { 'ACCC-YCUC-5AX2-FS64' }       +            before(:each) { login_as(nil) }       X            it 'returns login_path with the original request url as the redirect url' do   K              permalink = controller.send('get_permalink', 'beneficiaries')   8              expect(permalink.path).to eq('login_path')   V              expect(permalink.additional_parameters).to eq({ redirect: request.url })               end             end       %          context 'when logged in' do               let(:account) do   k              CustomerAccountView.new_mock(accountId: '1234', externalizedAccountId: 'ACCC-YCUC-5AX2-FS64')               end       r            before(:each) { user_service.expects(:get_customer_accounts_by_user_id).with(123).returns([account]) }       h            context 'when the external account id exists in get_customer_accounts_by_user_id results' do   0              let(:id) { 'ACCC-YCUC-5AX2-FS64' }       g              it 'converts the id to an internal account id and sets it as the additional parameter' do   M                permalink = controller.send('get_permalink', 'beneficiaries')   E                expect(permalink.path).to eq('settings_account_path')   I                expect(permalink.required_parameters).to eq([:accountId])   m                expect(permalink.additional_parameters).to eq({ accountId: '1234', anchor: 'beneficiaries' })                 end               end       p            context 'when the external account id does not exist in get_customer_accounts_by_user_id results' do   0              let(:id) { 'ACCC-YCUC-5AX2-0000' }       '              it 'should return nil' do   M                permalink = controller.send('get_permalink', 'beneficiaries')   ,                expect(permalink).to eq(nil)                 end               end             end           end   	      end       ,      context 'account-update-risk-score' do   =        before(:each) { controller.params[:account_id] = id }       "        context 'without an id' do             let(:id) { '' }       Y          before(:each) { user_service.expects(:get_customer_accounts_by_user_id).never }       %          it 'should return false' do   U            permalink = controller.send('get_permalink', 'account-update-risk-score')   *            expect(permalink).to eq(false)             end           end       >        context 'when the external account id is not valid' do             let(:id) { '%25' }       #          it 'should return nil' do   U            permalink = controller.send('get_permalink', 'account-update-risk-score')   *            expect(permalink).to eq(false)             end           end       0        context 'with an internal account id' do             let(:id) { '1234' }       Y          before(:each) { user_service.expects(:get_customer_accounts_by_user_id).never }       5          it 'sets additional parameter as the id' do   U            permalink = controller.send('get_permalink', 'account-update-risk-score')   B            expect(permalink.path).to eq('update_risk_score_path')   F            expect(permalink.required_parameters).to eq([:account_id])   m            expect(permalink.additional_parameters).to eq({ account_id: '1234', redirect: '/accounts/1234' })             end           end       0        context 'with an external account id' do   )          context 'when not logged in' do   .            let(:id) { 'ACCC-YCUC-5AX2-FS64' }       +            before(:each) { login_as(nil) }       X            it 'returns login_path with the original request url as the redirect url' do   W              permalink = controller.send('get_permalink', 'account-update-risk-score')   8              expect(permalink.path).to eq('login_path')   V              expect(permalink.additional_parameters).to eq({ redirect: request.url })               end             end       %          context 'when logged in' do               let(:account) do   k              CustomerAccountView.new_mock(accountId: '1234', externalizedAccountId: 'ACCC-YCUC-5AX2-FS64')               end       r            before(:each) { user_service.expects(:get_customer_accounts_by_user_id).with(123).returns([account]) }       h            context 'when the external account id exists in get_customer_accounts_by_user_id results' do   0              let(:id) { 'ACCC-YCUC-5AX2-FS64' }       g              it 'converts the id to an internal account id and sets it as the additional parameter' do   Y                permalink = controller.send('get_permalink', 'account-update-risk-score')   F                expect(permalink.path).to eq('update_risk_score_path')   J                expect(permalink.required_parameters).to eq([:account_id])   q                expect(permalink.additional_parameters).to eq({ account_id: '1234', redirect: '/accounts/1234' })                 end               end       p            context 'when the external account id does not exist in get_customer_accounts_by_user_id results' do   0              let(:id) { 'ACCC-YCUC-5AX2-0000' }       '              it 'should return nil' do   Y                permalink = controller.send('get_permalink', 'account-update-risk-score')   ,                expect(permalink).to eq(nil)                 end               end             end           end   	      end       /      it 'addon account opening from mobile' do   L        permalink = controller.send('get_permalink', 'mobile-addon-account')   E        expect(permalink.path).to eq('application_account_type_path')   7        expect(permalink.required_parameters).to eq([])   	      end              it 'autopilot overview' do   J        permalink = controller.send('get_permalink', 'autopilot-overview')   ?        expect(permalink.path).to eq('autopilot_overview_path')   	      end             it 'autopilot setup' do   G        permalink = controller.send('get_permalink', 'autopilot-setup')   B        expect(permalink.path).to eq('autopilot_setup_start_path')   	      end             it 'document upload' do   G        permalink = controller.send('get_permalink', 'document-upload')   <        expect(permalink.path).to eq('document_upload_path')   =        expect(permalink.required_parameters).to eq([:token])   	      end             it 'coworker-rewards' do   H        permalink = controller.send('get_permalink', 'coworker-rewards')   M        expect(permalink.path).to eq('coworker_referrals_email_welcome_path')   F        expect(permalink.required_parameters).to eq([:address, :hash])   	      end       end     end   end5�5��