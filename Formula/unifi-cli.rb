class UnifiCli < Formula
  desc "CLI for UniFi Network controllers"
  homepage "https://github.com/rvben/unifi-cli"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/unifi-cli/releases/download/v0.3.0/unifi-cli-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "f5f61660ac47d810773a856589afd12463725da7311480ab31aa243fdb3a894a"
    else
      url "https://github.com/rvben/unifi-cli/releases/download/v0.3.0/unifi-cli-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "ad864fc09881d3ce491a2315f5a95593fb599fa1c77e9adec38dcc134eacd791"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/unifi-cli/releases/download/v0.3.0/unifi-cli-v0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c630ce99dfb98865216e0e89a05d3a821ad4d9e45ffc25be5bbab696bae48619"
    else
      url "https://github.com/rvben/unifi-cli/releases/download/v0.3.0/unifi-cli-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1df64f3601679753900f8530bf2ee0a96f47ad0862270655a5e3809238c17fa9"
    end
  end

  def install
    bin.install "unifi"
  end

  test do
    system "#{bin}/unifi", "--version"
  end
end
