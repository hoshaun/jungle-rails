describe('Add To Cart', () => {
  beforeEach(() => {
    cy.visit("/");
  });
  
  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("Should click add to cart button", () => {
    cy.contains("Add")
      .first()
      .click({ force: true });
  });
})