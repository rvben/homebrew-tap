class Vership < Formula
  desc "Multi-target release orchestrator"
  homepage "https://github.com/rvben/vership"
  version "0.5.22"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.22/vership-v0.5.22-aarch64-apple-darwin.tar.gz"
      sha256 "b4b53ddb0d892d89a7050dcf1672f65704b023e75d1db74f09ae4ccdea7e1fed"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.22/vership-v0.5.22-x86_64-apple-darwin.tar.gz"
      sha256 "d6cdafcf83219c6b3cfbb8ae751659b97895923247e5e2b3b58fdfb6d9168682"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.22/vership-v0.5.22-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3800cc1c57234da6f5623d08902d6009f3560b6ebba6a0c950151ee88c924788"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.22/vership-v0.5.22-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1ed16a245a693bffe410007824636747799c465ad56ce58fb628a8664a0277f2"
    end
  end

  def install
    bin.install "vership"
  end

  test do
    system "#{bin}/vership", "--version"
  end
end
