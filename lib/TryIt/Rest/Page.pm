package TryIt::Rest::Page;

use Wing::Perl;
use Wing;
use Dancer;
use Wing::Rest; 



get '/api/page' => sub {
    ##Uncomment for data accessible only by registered users
    #my $user = get_user_by_session_id();
    my $data = site_db()->resultset('Page')->search(undef,{order_by => 'name'});
    #return format_list($data, current_user => $user); 
    return format_list($data); 
};

generate_crud('Page');

1;
