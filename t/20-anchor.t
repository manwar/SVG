use Test::More tests => 6;
use strict;
use SVG;

# test: style

my $svg=new SVG;
my $defs = $svg->defs();
my $out;
    # generate an anchor
    my $tag0 = $svg->anchor(
        -href=>'http://here.com/some/simpler/SVG.svg'
    );
    # add a circle to the anchor. The circle can be clicked on.
    $tag0->circle(cx=>10,cy=>10,r=>1);

    # more complex anchor with both URL and target
    $svg->comment("anchor with: -href, target");
    my $tag1 = $svg->anchor(
          -href   => 'http://example.com/some/page.html',
          target => 'new_window_1',
    );
    $tag1->circle(cx=>10,cy=>10,r=>1);

    $svg->comment("anchor with: -href, -title, -actuate, -show");
    my $tag2 = $svg->anchor(
        -href => 'http://example.com/some/other/page.html',
	-actuate => 'onLoad',
        -title => 'demotitle',
	-show=> 'embed',
    );
    $tag2->circle(cx=>10,cy=>10,r=>1);

$out = $tag0->xmlify;
ok($out =~ /http\:\/\/here\.com\/some\/simpler\/SVG\.svg/gs,"anchor 3: xlink href");

$out = $tag1->xmlify;
ok($out =~ /target\=\"new_window_1\"/gs,"anchor 4: target");

$out = $tag2->xmlify;
ok($out =~ /xlink\:title\=\"demotitle\"/gs,"anchor 6: title");
$out = $tag2->xmlify;
ok($out =~ /actuate/gs,"anchor 7: actuate");

$out = $tag2->xmlify;
ok($out =~ /xlink\:show\=\"embed\"/gs,"anchor 8: show");

    my $tag3 = $svg->a(
        -href   => 'http://example.com/some/page.html',
        -title => 'direct_a_tag',
        target => 'new_window_1',);

$out = $tag3->xmlify;
ok($out =~ /direct_a_tag/gs,"anchor 9: direct a method");

