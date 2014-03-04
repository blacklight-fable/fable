require 'spec_helper'

describe SolrDocument do
  
  let(:format_ssm) { "Archival Collection" }
  let(:document) do
    SolrDocument.new({
      :format_ssm => [format_ssm]
    })
  end
  
  describe ".normalized_format" do
    subject { document.normalized_format }
    
    context "when document is a collection level item" do
      it { should eql("archival_collection") }
    end
    
    context "when document is a series level item" do
      let(:format_ssm) { "Archival Series" }
      it { should eql("archival_series") }
    end
    
    context "when document is an item" do
      let(:format_ssm) { "Archival Item" }
      it { should eql("archival_item") }
    end    
    
  end
  
  describe ".method_missing" do
    
    context "when document is a collection level item" do
      subject { document.is_archival_collection? }
      it { should be_true }
      it { expect(document.is_archival_series?).to be_false }
      it { expect(document.is_archival_item?).to be_false }     
    end
    
    context "when document is a series level item" do
      let(:format_ssm) { "Archival Series" }
      subject { document.is_archival_series? }
      it { should be_true }
      it { expect(document.is_archival_collection?).to be_false }
      it { expect(document.is_archival_item?).to be_false }     
    end
    
    context "when document is an item" do
      let(:format_ssm) { "Archival Item" }
      subject { document.is_archival_item? }
      it { should be_true }
      it { expect(document.is_archival_collection?).to be_false }
      it { expect(document.is_archival_series?).to be_false }     
    end
    
  end
  
  
end