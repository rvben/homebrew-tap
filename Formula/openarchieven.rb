class Openarchieven < Formula
  desc "Command-line interface to the openarchieven.nl Dutch genealogical API"
  homepage "https://github.com/rvben/openarchieven-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/openarchieven-cli/releases/download/v0.1.0/openarchieven-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "c030b140a1a10d4b21b843acf582d94ca7de18f97f9566641b5cf0af1dcd72cb"
    else
      url "https://github.com/rvben/openarchieven-cli/releases/download/v0.1.0/openarchieven-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "884667e9ccc54dee8276f7f6c3579829f023a969ee98daa90ac05e62c502f99b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/openarchieven-cli/releases/download/v0.1.0/openarchieven-0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a59c4215ac0670f2656a94b696b4d9730729f795063ca27ae5c0968ad74b43ee"
    else
      url "https://github.com/rvben/openarchieven-cli/releases/download/v0.1.0/openarchieven-0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8282d6e5c1fd05fa0fd61b1435de1c7560cfd5080c6af0d8a7c556db0691b3c7"
    end
  end

  def install
    bin.install "openarchieven"
  end

  test do
    system "#{bin}/openarchieven", "version"
  end
end
