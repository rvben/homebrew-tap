class Kenteken < Formula
  desc "Look up Dutch vehicle data by licence plate from the RDW open data API"
  homepage "https://github.com/rvben/kenteken"
  version "0.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/kenteken/releases/download/v0.2.3/kenteken-v0.2.3-aarch64-apple-darwin.tar.gz"
      sha256 "eddc05fd34f206c4321af2b589eb71c475ef72d73e7dfb0399adcd690b746162"
    else
      url "https://github.com/rvben/kenteken/releases/download/v0.2.3/kenteken-v0.2.3-x86_64-apple-darwin.tar.gz"
      sha256 "e6f02390b91b1283d4a9758134f553b528afa627bb48d609543d01f25168942c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/kenteken/releases/download/v0.2.3/kenteken-v0.2.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "480dce73a5067823287765d78148ba64791c5d2cb6a1d415df41736ddbf2a514"
    else
      url "https://github.com/rvben/kenteken/releases/download/v0.2.3/kenteken-v0.2.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5242896e526208cc1404e57854dec60ca506e3b6b8b07e781ad05c6bf1fb0b6a"
    end
  end

  def install
    bin.install "kenteken"
  end

  test do
    system "#{bin}/kenteken", "--version"
  end
end
