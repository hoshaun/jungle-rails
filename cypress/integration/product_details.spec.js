describe('Home', () => {
  beforeEach(() => {
    cy.visit("/");
  });
  
  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("Should go to product details page", () => {
    cy.get(".products article a").first().click();
  });
})
