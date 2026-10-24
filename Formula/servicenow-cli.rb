class ServicenowCli < Formula
  desc "Manage ServiceNow records and workflows"
  homepage "https://github.com/rvben/servicenow-cli"
  version "0.5.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/servicenow-cli/releases/download/v0.5.3/servicenow-cli-v0.5.3-aarch64-apple-darwin.tar.gz"
      sha256 "cbc39997437ed7fbdb78134d8508be71678cd92180dfd1f3a4a88ad1b5602b8d"
    else
      url "https://github.com/rvben/servicenow-cli/releases/download/v0.5.3/servicenow-cli-v0.5.3-x86_64-apple-darwin.tar.gz"
      sha256 "14cf6adfa481a4864b9786915376b04268e9d84ff26d3bf82859c41192de27df"
    end
  end

  on_linux do
    depends_on "rust" => :build

    on_arm do
      url "https://static.crates.io/crates/servicenow-cli/servicenow-cli-0.5.3.crate"
      sha256 "04ff081cc7b22eadf7efc080dbe237b4aecb847a95b2bdb99a146a90438583cc"
    end
    on_intel do
      url "https://static.crates.io/crates/servicenow-cli/servicenow-cli-0.5.3.crate"
      sha256 "04ff081cc7b22eadf7efc080dbe237b4aecb847a95b2bdb99a146a90438583cc"
    end
  end

  def install
    if OS.linux?
      system "cargo", "install", *std_cargo_args, "--bin", "servicenow"
    else
      bin.install "servicenow"
    end
    bin.install_symlink "servicenow" => "servicenow-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/servicenow --version")
    assert_match version.to_s, shell_output("#{bin}/servicenow-cli --version")
    assert_match "Usage:", shell_output("#{bin}/servicenow --help")
  end
end
