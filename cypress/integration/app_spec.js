describe( 'Home', function() {
    before(() => {
        cy.visit( 'http://localhost:8080' );
    });

    it( 'Link to login', function() {
        cy.get('a[href="/login"]');
    });

    it( 'Link to register', function() {
        cy.get('a[href="/register"]');
    });

    it( 'Must have less than 11 articles', function() {
        cy.get('div.page')
        .find('div.article-preview')
        .its('length')
        .should('be.lt', 11)
    });

    it( 'Tag list', function() {
        cy.get('div.tag-list')
        .find('a.tag-default')
        .its('length')
        .should('be.gt', 1)
    });

});

describe( 'Login', function() {
    before(() => {
        cy.visit( 'http://localhost:8080/login' );
    })
    
    it( 'Link to register', function() {
        cy.get('a[href="/register"]');
    });

    it( 'Input email and password', function() {
        cy.get('input[type=email]').type('foo@bar.com');
        cy.get('input[type=password]').type(' ');
    });

    it( 'Submit button', function() {
        cy.get('button[type=submit]');
        cy.get('form').submit()
    });

    it( 'Error panel', function() {
        cy.get('ul.error-messages');
    });
} );