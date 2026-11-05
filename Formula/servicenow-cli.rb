class ServicenowCli < Formula
  desc "Manage ServiceNow records and workflows"
  homepage "https://github.com/rvben/servicenow-cli"
  version "0.6.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/servicenow-cli/releases/download/v0.6.2/servicenow-cli-v0.6.2-aarch64-apple-darwin.tar.gz"
      sha256 "df7608dd0a103654ed73cc841ef085dd1f3ebd50bee2ed64ac105647fd291999"
    else
      url "https://github.com/rvben/servicenow-cli/releases/download/v0.6.2/servicenow-cli-v0.6.2-x86_64-apple-darwin.tar.gz"
      sha256 "2485c00306ffa91bee4e273fc47dc73f88107689e48bb2103d42c67de5e8752a"
    end
  end

  on_linux do
    depends_on "rust" => :build

    on_arm do
      url "https://static.crates.io/crates/servicenow-cli/servicenow-cli-0.6.2.crate"
      sha256 "5667c872f14fbf4d773cd34a0748410d5a397a84d274b4acc231b9cf2afefd9e"
    end
    on_intel do
      url "https://static.crates.io/crates/servicenow-cli/servicenow-cli-0.6.2.crate"
      sha256 "5667c872f14fbf4d773cd34a0748410d5a397a84d274b4acc231b9cf2afefd9e"
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
