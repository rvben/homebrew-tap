class Verg < Formula
  desc "Stateless infrastructure convergence engine"
  homepage "https://github.com/rvben/verg"
  version "0.8.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/verg/releases/download/v0.8.1/verg-v0.8.1-aarch64-apple-darwin.tar.gz"
      sha256 "b10db0156cf37a42cb7877ab2e1bbdbffd47d0190f4ef740fb32853270d41b7c"
    else
      url "https://github.com/rvben/verg/releases/download/v0.8.1/verg-v0.8.1-x86_64-apple-darwin.tar.gz"
      sha256 "2867325d3ef01c1e37387b088112ca61e5335b5735891bfbc0cd178ea2295bed"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/verg/releases/download/v0.8.1/verg-v0.8.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6ac6e03e3d6e532e32cb746338d943ef6997996bb0121625b1141f9f06688474"
    else
      url "https://github.com/rvben/verg/releases/download/v0.8.1/verg-v0.8.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fb428a86531d4aa08ff316eb0464c3cb30d7a4a28cb66adb89f76127204d94f5"
    end
  end

  def install
    bin.install "verg"
  end

  test do
    system "#{bin}/verg", "--version"
  end
end
