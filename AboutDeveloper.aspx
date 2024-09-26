<%@ Page Title="About Developers" MasterPageFile="Website.master" AutoEventWireup="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
    	.cont {
    		max-width: 100%;
    		margin: 0 auto;
    		padding: 20px;
    		text-align: center;
    		background-color: #f8f9fa;
    		box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    		border-radius: 12px;
    	}

    		.cont h1 {
    			font-size: 2.5em;
    			color: #343a40;
    			margin-bottom: 30px;
    			font-weight: 600;
    			text-transform: uppercase;
    			letter-spacing: 1.5px;
    		}

    	.dev-cont {
    		display: flex;
    		flex-wrap: wrap;
    		justify-content: center;
    	}

    	.dev {
    		display: flex;
    		flex-direction: row;
    		align-items: center;
    		justify-content: center;
    		background-color: #fff;
    		border-radius: 12px;
    		padding: 20px;
    		margin: 15px;
    		box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    		transition: transform 0.3s ease, box-shadow 0.3s ease;
    	}

    		.dev:hover {
    			transform: translateY(-5px);
    			box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
    		}

    	.dev-img {
    		margin-right: 20px;
    	}

    		.dev-img img {
    			width: 130px;
    			height: 170px;
    			border-radius: 50%;
    			border: 3px solid #007bff;
    			transition: transform 0.3s ease;
    		}

    			.dev-img img:hover {
    				transform: rotate(5deg);
    			}

    	.dev-des h2 {
    		margin: 0;
    		font-size: 1.8em;
    		color: #007bff;
    		font-weight: 500;
    	}

    	.dev-des p {
    		margin: 8px 0;
    		font-size: 1.1em;
    		color: #495057;
    		line-height: 1.6;
    	}

    	.dev a {
    		color: #007bff;
    		text-decoration: none;
    		transition: color 0.3s ease;
    	}

    		.dev a:hover {
    			color: #0056b3;
    			text-decoration: underline;
    		}

    	.dev-des a i {
    		font-size: 1.5em;
    		margin: 0 8px;
    		color: #6c757d;
    		transition: color 0.3s ease;
    	}

    		.dev-des a i:hover {
    			color: #007bff;
    		}

    	@media (max-width: 768px) {
    		.dev {
    			flex-direction: column;
    			align-items: center;
    			padding: 20px;
    		}

    		.dev-img {
    			margin: 0 0 15px 0;
    		}

    		.dev-des h2 {
    			font-size: 1.6em;
    		}

    		.dev-des p {
    			font-size: 1em;
    		}
    	}

    	@media (max-width: 480px) {
    		.dev {
    			margin-bottom: 25px;
    		}

    		.dev-des h2 {
    			font-size: 1.5em;
    		}

    		.dev-des p {
    			font-size: 0.95em;
    		}

    		.cont h1 {
    			font-size: 2em;
    		}
    	}
    </style>
    <script>
        function adjustWidth() {
            const devs = document.querySelectorAll('.dev');
            if (devs.length > 0) {
                if (window.innerWidth > 768) {
                    devs.forEach(dev => dev.style.width = ''); // Reset width before calculation

                    let maxDevWidth = Array.from(devs).reduce((maxWidth, dev) => {
                        return Math.max(maxWidth, dev.offsetWidth);
                    }, 0);

                    // Apply the maximum width to all devs
                    devs.forEach(dev => {
                        dev.style.width = maxDevWidth + 'px';
                    });
                } else {
                    devs.forEach(dev => {
                        dev.style.width = '100%'; // Reset on smaller screens
                    });
                }
            }
        }

        // Debounce function for performance on resize
        function debounce(func, delay) {
            let timeout;
            return function () {
                clearTimeout(timeout);
                timeout = setTimeout(() => {
                    func();
                }, delay);
            };
        }

        // Initialize on load and resize with debounced handler
        window.addEventListener('load', adjustWidth);
        window.addEventListener('resize', debounce(() => {
            adjustWidth(); // Ensure widths are recalculated properly
        }, 150));

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content1" runat="Server">
    <div class="cont">
        <h1>Website Developing Team</h1>
        <div class="dev-cont">
            <div class="dev">
                <div class="dev-img">
                    <img alt="Punj Prakash" src="img/dev/punj.jpg" />
                </div>
                <div class="dev-des">
                    <h2>Punj Prakash<span style="color: black; font-size: medium;"> (Team Leader)</span></h2>
                    <p>
                        Session:&nbsp;&nbsp;<b>2022-2024</b><br />
                        Work:&nbsp;&nbsp;<b>Front-End, Back-End and Database</b><br />
                        Phone / Whatsapp No.:&nbsp;&nbsp;<b><a href="tel:+91 9060311534">+91 9060311534</a></b><br />
                        E-Mail Id.:&nbsp;&nbsp;<b><a href="mailto:punjprakashpp@gmail.com">punjprakashpp@gmail.com</a></b><br />
                        Social Links:
                    &nbsp;&nbsp;<a href="https://www.facebook.com/punjprakashop" target="_blank"><i class="fa fa-facebook"></i></a>
                        &nbsp;&nbsp;<a href="https://www.instagram.com/punjprakashpp" target="_blank"><i class="fa fa-instagram"></i></a>
                        &nbsp;&nbsp;<a href="https://x.com/punjprakashpp" target="_blank"><i class="fa fa-x-twitter"></i></a>
                        &nbsp;&nbsp;<a href="https://github.com/punjprakashpp" target="_blank"><i class="fa fa-github"></i></a>
                        &nbsp;&nbsp;<a href="https://www.linkedin.com/in/punjprakashpp" target="_blank"><i class="fa fa-linkedin"></i></a>
                    </p>
                </div>
            </div>
            <div class="dev">
                <div class="dev-img">
                    <img alt="Anmol Ratan" src="img/dev/anmol.jpg" />
                </div>
                <div class="dev-des">
                    <h2>Anmol Ratan</h2>
                    <p>
                        Session:&nbsp;&nbsp;<b>2022-2024</b><br />
                        Work:&nbsp;&nbsp;<b>Front-End and Back-End</b><br />
                        Phone No.:&nbsp;&nbsp;<a href="tel:+918434032071"><b>+91 8434032071</b></a><br />
                        E-Mail Id.:&nbsp;&nbsp;<b><a href="mailto:yadavnmol@gmail.com">yadavnmol@gmail.com</a></b><br />
                        Social Links:
                    &nbsp;&nbsp;<a href="https://www.facebook.com/Yadavnmol" target="_blank"><i class="fa fa-facebook"></i></a>
                        &nbsp;&nbsp;<a href="https://www.instagram.com/anmol_king" target="_blank"><i class="fa fa-instagram"></i></a>
                        &nbsp;&nbsp;<a href="https://x.com/AnmolKing03" target="_blank"><i class="fa fa-x-twitter"></i></a>
                        &nbsp;&nbsp;<a href="https://github.com/AnmolKing03" target="_blank"><i class="fa fa-github"></i></a>
                        &nbsp;&nbsp;<a href="https://www.linkedin.com/in/#" target="_blank"><i class="fa fa-linkedin"></i></a>
                    </p>
                </div>
            </div>
            <div class="dev">
                <div class="dev-img">
                    <img alt="Anand Prakash" src="img/dev/anand.jpg" />
                </div>
                <div class="dev-des">
                    <h2>Anand Prakash</h2>
                    <p>
                        Session:&nbsp;&nbsp;<b>2022-2024</b><br />
                        Work:&nbsp;&nbsp;<b>Front-End and Back-End</b><br />
                        Phone No.:&nbsp;&nbsp;<a href="tel:+918434032071"><b>+91 9801441325</b></a><br />
                        E-Mail Id.:&nbsp;&nbsp;<b><a href="mailto:anandprakash4568@gmail.com">anandprakash4568@gmail.com</a></b>
                    </p>
                </div>
            </div>
            <div class="dev">
                <div class="dev-img">
                    <img alt="Anand Prakash" src="img/dev/anurag.jpg" />
                </div>
                <div class="dev-des">
                    <h2>Anurag Bhardwaj</h2>
                    <p>
                        Session:&nbsp;&nbsp;<b>2022-2024</b><br />
                        Work:&nbsp;&nbsp;<b>Front-End and Back-End</b><br />
                        Phone No.:&nbsp;&nbsp;<a href="tel:+918434032071"><b>+91 9110019419</b></a><br />
                        E-Mail Id.:&nbsp;&nbsp;<b><a href="mailto:anuragbhardwajab@gmail.com">anuragbhardwajab@gmail.com</a></b>
                    </p>
                </div>
            </div>
        </div>
        <br />
        <h1>Guiding cum Supervising Team</h1>
        <div class="dev-cont">
            <div class="dev">
                <div class="dev-img">
                    <img alt="Rakesh Kumar Pandey" src="img/dev/rak.jpg" />
                </div>
                <div class="dev-des">
                    <h2>Dr. Rakesh Kumar Pandey</h2>
                    <p>
                        Faculty:&nbsp;&nbsp;<b>UDCA, TMBU</b><br />
                        Phone No.:&nbsp;&nbsp;<b><a href="tel:+91 9546040085">+91 9546040085</a></b><br />
                        E-Mail Id.:&nbsp;&nbsp;<b><a href="mailto:rakeshkrpandey1978@gmail.com">rakeshkrpandey1978@gmail.com</a></b>
                    </p>
                </div>
            </div>
            <div class="dev">
                <div class="dev-img">
                    <img alt="Sheo Shankar Prasad" src="img/dev/sheo.jpg" />
                </div>
                <div class="dev-des">
                    <h2>Dr. Sheo Shankar Prasad</h2>
                    <p>
                        Faculty:&nbsp;&nbsp;<b>UDCA, TMBU</b><br />
                        Phone No.:&nbsp;&nbsp;<b><a href="tel:+91 9162380697">+91 9162380697</a></b><br />
                        E-Mail Id.:&nbsp;&nbsp;<b><a href="mailto:sheobgp@gmail.com">sheobgp@gmail.com</a></b>
                    </p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>