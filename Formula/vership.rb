class Vership < Formula
  desc "Multi-target release orchestrator"
  homepage "https://github.com/rvben/vership"
  version "0.4.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.4.5/vership-v0.4.5-aarch64-apple-darwin.tar.gz"
      sha256 "eca5d94b748e5bf7aa8b5795b62cda6055369d97a5803bb96292344ecfb30a20"
    else
      url "https://github.com/rvben/vership/releases/download/v0.4.5/vership-v0.4.5-x86_64-apple-darwin.tar.gz"
      sha256 "b9169c038b3e88d40edc5aea8b74c8085aeb2fbd99034ca60403536afca6786f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.4.5/vership-v0.4.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c6e68445beee5edc7094eb815f7d66313207205ba9601d0857beca6578584d4c"
    else
      url "https://github.com/rvben/vership/releases/download/v0.4.5/vership-v0.4.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0031ae21da7c970f3103de9119837091147b0a26b99f68899bebffb467b0e2ef"
    end
  end

  def install
    bin.install "vership"
  end

  test do
    system "#{bin}/vership", "--version"
  end
end
