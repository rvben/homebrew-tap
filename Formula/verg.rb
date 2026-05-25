class Verg < Formula
  desc "Stateless infrastructure convergence engine"
  homepage "https://github.com/rvben/verg"
  version "0.6.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/verg/releases/download/v0.6.3/verg-v0.6.3-aarch64-apple-darwin.tar.gz"
      sha256 "811ca7ed8da81e64b3cda69252242253fdb2137e10cbb8a5f76d4c73cf27f859"
    else
      url "https://github.com/rvben/verg/releases/download/v0.6.3/verg-v0.6.3-x86_64-apple-darwin.tar.gz"
      sha256 "e86c4d03d5760076195723c3b36cc780bbcc04c2c5bf70c83ad8acbf63a9fe33"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/verg/releases/download/v0.6.3/verg-v0.6.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2916d0788d0bf91035121a80a448a9aef761477b314d5c52faa7298f5f291980"
    else
      url "https://github.com/rvben/verg/releases/download/v0.6.3/verg-v0.6.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2be79042a6c588ddaef365e3c66be000dc872598dc729c153c4c27c4cefe6a45"
    end
  end

  def install
    bin.install "verg"
  end

  test do
    system "#{bin}/verg", "--version"
  end
end
