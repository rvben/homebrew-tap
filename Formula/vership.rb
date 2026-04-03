class Vership < Formula
  desc "Multi-target release orchestrator"
  homepage "https://github.com/rvben/vership"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.4.2/vership-v0.4.2-aarch64-apple-darwin.tar.gz"
      sha256 "c508fb211a9433110bc5960c403c9ac1ccde98bae242a13556d487a771a734b9"
    else
      url "https://github.com/rvben/vership/releases/download/v0.4.2/vership-v0.4.2-x86_64-apple-darwin.tar.gz"
      sha256 "ab220f294ec7616a680edeb49520e1b13ab1caf9dc5055259e95fbc606b5a088"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.4.2/vership-v0.4.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6d0b3c77dcd2237c60c44ac2c4f725319bf36af6383eff0b6b5f39fc8799819b"
    else
      url "https://github.com/rvben/vership/releases/download/v0.4.2/vership-v0.4.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "187ad46eed8bb25cbeae42bb6ff0f3fb131eb7a889085a8cb30763532ee99188"
    end
  end

  def install
    bin.install "vership"
  end

  test do
    system "#{bin}/vership", "--version"
  end
end
