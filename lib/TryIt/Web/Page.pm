package TryIt::Web::Page;

use Dancer ':syntax';
use Wing::Perl;
use Ouch;
use Wing;
use Wing::Web;




get '/page' => sub {
    my $user = eval { get_user_by_session_id(); };
    my $vars = {};
    if ($user) {
        $vars->{current_user} = describe($user, current_user => $user);
    }
    template 'page/index', $vars;
};

post '/page' => sub {
    my $current_user = get_user_by_session_id();
    my $page = site_db()->resultset('Page')->new({});
    my %params = params();
    eval {
        $page->verify_creation_params(\%params, $current_user);
        $page->verify_posted_params(\%params, $current_user);
    };
    if (hug) {
        return redirect '/page?error_message='.bleep;
    }
    else {
        $page->insert;
        return redirect '/page/'.$page->id.'?success_message=Created successfully';
    }
};

get '/page/:id' => sub {
    my $current_user = eval { get_user_by_session_id(); };
    my $page = fetch_object('Page');
    my $vars = {
        page         => describe($page, current_user => $current_user),
    };
    if ($current_user) {
        $vars->{current_user} = describe($current_user, current_user => $current_user);
    }
    template 'page/view_edit', $vars;
};

put '/page/:id' => sub {
    my $current_user = get_user_by_session_id();
    my $page = fetch_object('Page');
    $page->can_edit($current_user);
    my %params = params();
    eval {
        $page->verify_posted_params(\%params, $current_user);
    };
    if (hug) {
        return redirect '/page/'.$page->id.'?error_message='.bleep;
    }
    else {
        $page->update;
        return redirect '/page/'.$page->id.'?success_message=Created successfully';
    }
    return redirect '/TryIt/'.$page->id;
};

del '/page/:id' => sub {
    my $current_user = get_user_by_session_id();
    my $page = fetch_object('Page');
    $page->can_edit($current_user);
    $page->delete;
    return redirect '/?success_message=Deleted successfully';
};

true;
