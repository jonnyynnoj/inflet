require "./spec_helper"

describe Inflet do
  describe Inflet::Container do
    it "should resolve a bound service" do
      boundService = Container.resolve(BoundService)

      boundService.prop.should eq "test"
    end
  end

  describe Inflet::Autowire do
    it "should resolve an autowired service" do
      autowiredService = Container.resolve(AutowiredService)

      autowiredService.should be_a AutowiredService
      autowiredService.foo.should be_a Foo
      autowiredService.bound_service.should be_a BoundService
      autowiredService.bound_service.prop.should eq "test"
    end
  end
end
