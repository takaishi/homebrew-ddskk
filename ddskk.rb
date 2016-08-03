# based on https://gist.github.com/nagae/3009185
require 'formula'

class Ddskk < Formula
  desc 'Daredevil SKK(Simple Kana to Kanji conversion program)'
  homepage 'http://openlab.ring.gr.jp/skk/'
  url 'http://openlab.ring.gr.jp/skk/maintrunk/ddskk-15.2.tar.gz'
  sha256 '0d334c072a5eb3725173b398fce4839217d53e32c624653b5aca14a008788b9c'
  
  depends_on 'emacs'

  def install
    open("SKK-CFG", 'a'){|f| f.puts(<<-CFG) }
      (setq SKK_DATADIR "#{share}/skk")
      (setq SKK_LISPDIR "#{share}/emacs/site-lisp")
      (setq SKK_INFODIR "#{share}/info")
      (setq SKK_SET_JISYO nil)
      (setq SKK_TUTORIALS nil)
    CFG

    system "make"
    system "make install PREFIX=#{prefix}"
  end
end
