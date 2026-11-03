<%@ Page Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="FoodMenu.aspx.cs" Inherits="Bro_Screen_Cinemas.FoodMenu" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/FoodMenu.css?v=<%= DateTime.Now.Ticks %>">
    <style>
        nav {
            opacity: 0;
            z-index: -10;
        }
    </style>
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" ShowStartingNode="True" />
        <asp:SiteMapPath ID="Breadcrumb" runat="server"/>
    </div>
    <main>
        <h1 class="header">Food and Beverages</h1>
        <!-- Navigation Bar -->
        <div id="nav" class="navbar">
            <div class="navContent">
                <a href="#promotion">Promotion</a>
                <a href="#food">Food</a>
                <a href="#drinks">Drinks</a>
                <a href="#other">Other</a>
                <a href="#cart" class="cart-icon">
                    <span id="cart-badge" class="cart-badge">0</span>
                </a>
            </div>
        </div>

        <button id="backToTop" title="Back to Top">↑</button>

        <!-- Promotion Section -->
        <section id="promotion" class="category">
            <h2>Promotion</h2>
            <div class="items">
                <div class="item" data-price="18">
                    <img src="image/promoFnB1.png" alt="Promo Item 1">
                    <h3>Jimat Kombo Single</h3>
                    <p>RM 18.00</p>
                    <div class="quantityCon">
                        <label for="quantity">Quantity:</label>
                        <input type="number" min="1" value="1" class="quantity-input">
                    </div>
                    <button type="button" onclick="addToCart(this)">Add to Cart</button>
                </div>
                <div class="item" data-price="40">
                    <img src="image/promoFnB2.png" alt="promoFnB Item 2">
                    <h3>Jimat Kombo Family</h3>
                    <p>RM 40.00</p>
                    <div class="quantityCon">
                        <label for="quantity">Quantity:</label>
                        <input type="number" min="1" value="1" class="quantity-input">
                    </div>
                    <button type="button" onclick="addToCart(this)">Add to Cart</button>
                </div>
                <div class="item" data-price="15">
                    <img src="image/promoFnB3.png" alt="promoFnB Item 3">
                    <h3>Popcorn Caramel Combo</h3>
                    <p>RM 15.00</p>
                    <div class="quantityCon">
                        <label for="quantity">Quantity:</label>
                        <input type="number" min="1" value="1" class="quantity-input">
                    </div>
                    <button type="button" onclick="addToCart(this)">Add to Cart</button>
                </div>
                <div class="item" data-price="15">
                    <img src="image/promoFnB4.png" alt="promoFnB Item 1">
                    <h3>Popcorn Seasalt Combo</h3>
                    <p>RM 15.00</p>
                    <div class="quantityCon">
                        <label for="quantity">Quantity:</label>
                        <input type="number" min="1" value="1" class="quantity-input">
                    </div>
                    <button type="button" onclick="addToCart(this)">Add to Cart</button>
                </div>
                <div class="item" data-price="15">
                    <img src="image/promoFnB5.png" alt="promoFnB Item 2">
                    <h3>Popcorn Mix Combo</h3>
                    <p>RM 15.00</p>
                    <div class="quantityCon">
                        <label for="quantity">Quantity:</label>
                        <input type="number" min="1" value="1" class="quantity-input">
                    </div>
                    <button type="button" onclick="addToCart(this)">Add to Cart</button>
                </div>
                <div class="item" data-price="12">
                    <img src="image/promoFnB6.png" alt="promoFnB Item 3">
                    <h3>Nugget Large Combo</h3>
                    <p>RM 12.00</p>
                    <div class="quantityCon">
                        <label for="quantity">Quantity:</label>
                        <input type="number" min="1" value="1" class="quantity-input">
                    </div>
                    <button type="button" onclick="addToCart(this)">Add to Cart</button>
                </div>
                <div class="item" data-price="12">
                    <img src="image/promoFnB7.png" alt="promoFnB Item 2">
                    <h3>Cocktail Sausage Combo</h3>
                    <p>RM 12.00</p>
                    <div class="quantityCon">
                        <label for="quantity">Quantity:</label>
                        <input type="number" min="1" value="1" class="quantity-input">
                    </div>
                    <button type="button" onclick="addToCart(this)">Add to Cart</button>
                </div>
                <div class="item" data-price="10">
                    <img src="image/promoFnB8.png" alt="promoFnB Item 3">
                    <h3>Hotdog Combo</h3>
                    <p>RM 10.00</p>
                    <div class="quantityCon">
                        <label for="quantity">Quantity:</label>
                        <input type="number" min="1" value="1" class="quantity-input">
                    </div>
                    <button type="button" onclick="addToCart(this)">Add to Cart</button>
                </div>
                <!-- Add more items as needed -->
            </div>
        </section>

        <!-- Food Section -->
        <section id="food" class="category">
            <h2>Food</h2>
            <div class="items">
                <div class="item" data-price="10">
                    <img src="image/food1.png" alt="Food Item 1">
                    <h3>Popcorn Caramel</h3>
                    <p>RM 10.00</p>
                    <div class="quantityCon">
                        <label for="quantity">Quantity:</label>
                        <input type="number" min="1" value="1" class="quantity-input">
                    </div>
                    <button type="button" onclick="addToCart(this)">Add to Cart</button>
                </div>
                <div class="item" data-price="10">
                    <img src="image/food1.png" alt="Food Item 2">
                    <h3>Popcorn Seasalt</h3>
                    <p>RM 10.00</p>
                    <div class="quantityCon">
                        <label for="quantity">Quantity:</label>
                        <input type="number" min="1" value="1" class="quantity-input">
                    </div>
                    <button type="button" onclick="addToCart(this)">Add to Cart</button>
                </div>
                <div class="item" data-price="8">
                    <img src="image/food2.png" alt="Food Item 3">
                    <h3>Nugget</h3>
                    <p>RM 8.00</p>
                    <div class="quantityCon">
                        <label for="quantity">Quantity:</label>
                        <input type="number" min="1" value="1" class="quantity-input">
                    </div>
                    <button type="button" onclick="addToCart(this)">Add to Cart</button>
                </div>
                <div class="item" data-price="8">
                    <img src="image/food3.png" alt="Food Item 1">
                    <h3>Chicken Meatball</h3>
                    <p>RM 8.00</p>
                    <div class="quantityCon">
                        <label for="quantity">Quantity:</label>
                        <input type="number" min="1" value="1" class="quantity-input">
                    </div>
                    <button type="button" onclick="addToCart(this)">Add to Cart</button>
                </div>
                <div class="item" data-price="15">
                    <img src="image/food4.png" alt="Food Item 2">
                    <h3>Chicken Drums</h3>
                    <p>RM 15.00</p>
                    <div class="quantityCon">
                        <label for="quantity">Quantity:</label>
                        <input type="number" min="1" value="1" class="quantity-input">
                    </div>
                    <button type="button" onclick="addToCart(this)">Add to Cart</button>
                </div>
                <div class="item" data-price="6">
                    <img src="image/food5.png" alt="Food Item 3">
                    <h3>Hotdog</h3>
                    <p>RM 6.00</p>
                    <div class="quantityCon">
                        <label for="quantity">Quantity:</label>
                        <input type="number" min="1" value="1" class="quantity-input">
                    </div>
                    <button type="button" onclick="addToCart(this)">Add to Cart</button>
                </div>
                <div class="item" data-price="6">
                    <img src="image/food6.png" alt="Food Item 3">
                    <h3>Corn in Cup</h3>
                    <p>RM 6.00</p>
                    <div class="quantityCon">
                        <label for="quantity">Quantity:</label>
                        <input type="number" min="1" value="1" class="quantity-input">
                    </div>
                    <button type="button" onclick="addToCart(this)">Add to Cart</button>
                </div>
                <!-- Add more items as needed -->
            </div>
        </section>

        <!-- Drinks Section -->
        <section id="drinks" class="category">
            <h2>Drinks</h2>
            <div class="items">
                <div class="item" data-price="5">
                    <img src="image/drink1.png" alt="Drink Item 1">
                    <h3>Coca cola</h3>
                    <p>RM 5.00</p>
                    <div class="quantityCon">
                        <label for="quantity">Quantity:</label>
                        <input type="number" min="1" value="1" class="quantity-input">
                    </div>
                    <button type="button" onclick="addToCart(this)">Add to Cart</button>
                </div>
                <div class="item" data-price="6">
                    <img src="image/drink2.png" alt="Drink Item 2">
                    <h3>Dutch Lady</h3>
                    <p>RM 6.00</p>
                    <div class="quantityCon">
                        <label for="quantity">Quantity:</label>
                        <input type="number" min="1" value="1" class="quantity-input">
                    </div>
                    <button type="button" onclick="addToCart(this)">Add to Cart</button>
                </div>
                <div class="item" data-price="6">
                    <img src="image/drink3.png" alt="Drink Item 3">
                    <h3>Hot Tea</h3>
                    <p>RM 6.00</p>
                    <div class="quantityCon">
                        <label for="quantity">Quantity:</label>
                        <input type="number" min="1" value="1" class="quantity-input">
                    </div>
                    <button type="button" onclick="addToCart(this)">Add to Cart</button>
                </div>
                <div class="item" data-price="5">
                    <img src="image/drink1.png" alt="Drink Item 1">
                    <h3>Sprite</h3>
                    <p>RM 5.00</p>
                    <div class="quantityCon">
                        <label for="quantity">Quantity:</label>
                        <input type="number" min="1" value="1" class="quantity-input">
                    </div>
                    <button type="button" onclick="addToCart(this)">Add to Cart</button>
                </div>
                <div class="item" data-price="6">
                    <img src="image/drink4.png" alt="Drink Item 2">
                    <h3>Milo</h3>
                    <p>RM 6.00</p>
                    <div class="quantityCon">
                        <label for="quantity">Quantity:</label>
                        <input type="number" min="1" value="1" class="quantity-input">
                    </div>
                    <button type="button" onclick="addToCart(this)">Add to Cart</button>
                </div>
                <!-- Add more items as needed -->
            </div>
        </section>

        <!-- Other Section -->
        <section id="other" class="category">
            <h2>Other</h2>
            <div class="items">
                <div class="item" data-price="20">
                    <img src="image/other1.png" alt="Other Item 1">
                    <h3>BSC Reuseable Bag</h3>
                    <p>RM 20.00</p>
                    <div class="quantityCon">
                        <label for="quantity">Quantity:</label>
                        <input type="number" min="1" value="1" class="quantity-input">
                    </div>
                    <button type="button" onclick="addToCart(this)">Add to Cart</button>
                </div>
                <div class="item" data-price="50">
                    <img src="image/other2.png" alt="Other Item 2">
                    <h3>BSC Figure</h3>
                    <p>RM 50.00</p>
                    <div class="quantityCon">
                        <label for="quantity">Quantity:</label>
                        <input type="number" min="1" value="1" class="quantity-input">
                    </div>
                    <button type="button" onclick="addToCart(this)">Add to Cart</button>
                </div>
                <div class="item" data-price="40">
                    <img src="image/other3.png" alt="Other Item 3">
                    <h3>BSC Cup</h3>
                    <p>RM 40.00</p>
                    <div class="quantityCon">
                        <label for="quantity">Quantity:</label>
                        <input type="number" min="1" value="1" class="quantity-input">
                    </div>
                    <button type="button" onclick="addToCart(this)">Add to Cart</button>
                </div>
                <!-- Add more items as needed -->
            </div>
        </section>

        <!-- Cart Section -->
        <div id="cart" class="cart-container">
            <h2>Shopping Cart</h2>
            <div id="cart-items" class="cart-items"></div>
            <div class="cart-summary">
                <p class="cart-total">
                    Total: RM <span id="cart-total">0.00</span>
                </p>
                <button type="button" class="checkout-btn" onclick="confirmCart()">Proceed to Checkout</button>
            </div>
        </div>


        <script>
            // Detect Source and Use Unique Cart
            const source = localStorage.getItem('navigationSource');
            const cartKey = source === 'PeopleType.html' ? 'peopletypeCart' : 'indexCart';
            const cart = JSON.parse(localStorage.getItem(cartKey)) || [];
            console.log(cart);

            function updateCartBadge() {
                const totalItems = cart.reduce((sum, item) => sum + item.quantity, 0);
                const badge = document.getElementById('cart-badge');

                if (totalItems > 0) {
                    badge.textContent = totalItems;
                    badge.style.display = 'block';

                    // Add animation when cart is updated
                    badge.classList.add('bump');
                    setTimeout(() => {
                        badge.classList.remove('bump');
                    }, 200);
                } else {
                    badge.style.display = 'none';
                }
            }
            function addToCart(button) {
                const item = button.closest('.item');
                const name = item.querySelector('h3').textContent;
                const price = parseFloat(item.dataset.price);
                const quantityInput = item.querySelector('.quantity-input');
                const quantity = parseInt(quantityInput.value, 10);

                if (isNaN(quantity) || quantity <= 0) {
                    alert('Please select a valid quantity.');
                    return;
                }

                const existingItem = cart.find(cartItem => cartItem.name === name);
                if (existingItem) {
                    existingItem.quantity += quantity;
                } else {
                    cart.push({ name, price, quantity });
                }

                localStorage.setItem('cart', JSON.stringify(cart));
                updateCart();
                showNotification(`${name} added to cart!`);
            }

            function updateCart() {
                const cartItemsContainer = document.getElementById('cart-items');
                let total = 0;

                const cartHTML = cart.map((cartItem, index) => {
                    total += cartItem.price * cartItem.quantity;
                    return `
                <div class="cart-item">
                    <span>${cartItem.name} (x${cartItem.quantity})</span>
                    <span>RM ${(cartItem.price * cartItem.quantity).toFixed(2)}</span>
                    <div>
                        <button onclick="modifyCart(${index}, 1)">+</button>
                        <button onclick="modifyCart(${index}, -1)">-</button>
                        <button onclick="removeFromCart(${index})">Remove</button>
                    </div>
                </div>`;
                }).join('');

                cartItemsContainer.innerHTML = cartHTML || '<p>Your cart is empty!</p>';
                document.getElementById('cart-total').textContent = total.toFixed(2);
                updateCartBadge();
            }

            function modifyCart(index, delta) {
                cart[index].quantity += delta;

                if (cart[index].quantity <= 0) {
                    cart.splice(index, 1);
                }

                localStorage.setItem('cart', JSON.stringify(cart));
                updateCart();
            }

            function removeFromCart(index) {
                cart.splice(index, 1);
                localStorage.setItem('cart', JSON.stringify(cart));
                updateCart();
            }

            function confirmCart() {
                if (cart.length === 0) {
                    alert('Your cart is empty!');
                    return;
                }
                localStorage.setItem(cartKey, JSON.stringify(cart));

                const queryString = window.location.search;
                const urlParams = new URLSearchParams(queryString);
                const MovieID = urlParams.get('MovieID');
                const date = urlParams.get('Date');
                const time = urlParams.get('Time');
                const cinema = urlParams.get('Cinema');

                window.location.href = `Payment.aspx?MovieID=${MovieID}&Date=${date}&Time=${time}&Cinema=${cinema}`;

            }

            function showNotification(message) {
                const notification = document.createElement('div');
                notification.className = 'notification';
                notification.textContent = message;
                document.body.appendChild(notification);

                setTimeout(() => {
                    notification.remove();
                }, 2000);
            }

            window.onload = () => {
                localStorage.setItem('visitedFoodMenu', 'true'); // Set flag when this page is loaded
                updateCart();
            };

            const backToTopButton = document.getElementById("backToTop");

            // Show the button when the user scrolls down 100px
            window.onscroll = function () {
                if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
                    backToTopButton.style.display = "block";
                } else {
                    backToTopButton.style.display = "none";
                }
            };

            // Scroll to the top when the button is clicked
            backToTopButton.addEventListener("click", function () {
                window.scrollTo({
                    top: 0,
                    behavior: "smooth",
                });
            });
        </script>
    </main>
</asp:Content>