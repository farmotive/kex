class Kex < Formula
  desc "Tool that can easily exec in to a kubernetes pod"
  homepage "https://github.com/farmotive/kex"
  url "https://github.com/farmotive/kex/archive/v0.0.1.tar.gz"
  sha256 "TODO"
  head "https://github.com/farmotive/kex.git"#, :branch => "if-needed"
  bottle :unneeded

  def install
    bin.install "kex" => : "kex"
    include.install "utils.bash"
  end

  test do
    system "which" : "kex"
  end
end
