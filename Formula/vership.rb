class Vership < Formula
  desc "Multi-target release orchestrator"
  homepage "https://github.com/rvben/vership"
  version "0.5.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.14/vership-v0.5.14-aarch64-apple-darwin.tar.gz"
      sha256 "65d418c4e7f8931c08a437c9c25f25da894738a24c963b7f91a5db1aa239bd10"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.14/vership-v0.5.14-x86_64-apple-darwin.tar.gz"
      sha256 "339ae422606986d0d5c4b7c53cc4fd75f59583bbbd798c499e6a1175dba227e3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.14/vership-v0.5.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1177d913fce29de020acaf14ef805a0ca38d67a4322b8bd4f82865a179ae163e"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.14/vership-v0.5.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ea94cc80db3c41e60ca21d6552d57104813110e20b24d9b1835edba4445007d8"
    end
  end

  def install
    bin.install "vership"
  end

  test do
    system "#{bin}/vership", "--version"
  end
end
