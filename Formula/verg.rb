class Verg < Formula
  desc "Stateless infrastructure convergence engine"
  homepage "https://github.com/rvben/verg"
  version "0.8.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/verg/releases/download/v0.8.3/verg-v0.8.3-aarch64-apple-darwin.tar.gz"
      sha256 "e17ef9cc1cfce5d012c521f7958d7a2a5038bc7a27e0ad38ef2b03a3977c4c4f"
    else
      url "https://github.com/rvben/verg/releases/download/v0.8.3/verg-v0.8.3-x86_64-apple-darwin.tar.gz"
      sha256 "c740b69315f8b37bbb56420fe691f9e6df3881868b0ec636924a8d9aa70eb943"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/verg/releases/download/v0.8.3/verg-v0.8.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2c067ba5ee7b37de3177b3792ead7b714d485ecc0fc37f90335a5bb6da6db9de"
    else
      url "https://github.com/rvben/verg/releases/download/v0.8.3/verg-v0.8.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "36877b5b204705a1d913985763c3acdeaec47af3cb96826af76732a4a1a845cf"
    end
  end

  def install
    bin.install "verg"
  end

  test do
    system "#{bin}/verg", "--version"
  end
end
