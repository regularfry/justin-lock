justin-lock
===========

Take a Gemfile on stdin, print a Gemfile.lock on stdout, using the
same rules as Bundler for resolving the gem dependencies.


Usage
-----

    cat Gemfile | justin-lock > Gemfile.lock

This will not take account of settings for other platforms already
present in Gemfile.lock. These will be overwritten. You *must* run
this on the platform you intend the Gemfile.lock to be valid for; it
likely will not be valid on others.

You may wish to maintain different Gemfile.lock versions for different
platforms. You may even wish to maintain different Gemfiles for
different platforms. You may wish to name your Gemfile and
Gemfile.lock *something other than Gemfile.* Justin has no opinions
on such matters.


Note
----

This is a quick and nasty hack. It has no tests, and in many ways is
the simplest thing that can possibly work. It is fortunate that it
functions in the slightest, and it is a testament to the robustness of
Bundler's code (and its rather intimidatingly thorough test suite)
that it is possible at all. Use at your own risk.


Author
------

Alex Young <alex@blackkettle.org>

However, the vast majority of this code is plundered from
https://github.com/bundler/bundler.git. The bits that are broken are
mine, the towering spires of glittering, majestic coding perfection
are theirs.