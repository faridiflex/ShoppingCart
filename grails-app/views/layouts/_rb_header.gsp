 <!--header-->
 <div class="top_header">
        <a href="intro.html" class="logo"><img src="${resource(dir:'images',file:'exp_logo.png')}" alt="etalent"/></a>
        <a href="javascript:void(0)" class="logo"><img src="${resource(dir:'images',file:'ucla_logo.png')}" alt="etalent"/></a>

        <div class="top_menu">

            <div class="top-links user">
                <ul class="links">
                    <li><a class="last_sign" href="">Sign out</a></li>
                </ul>
                <span class="welcome_msg">Hi ${resume?.expUser?.firstName}</span>
            </div>

            <div class="top-links">
               
            </div>

            <div class="menu">
                <ul>
                	<li><g:link action="viewMyResumes" controller="dashboard">Home</g:link></li>
                	<li><g:link action="viewMyResumes" controller="dashboard">Profile</g:link></li>
                	<li><g:link action="viewMyResumes" controller="dashboard" class="current">Documents</g:link></li>
                	<li><g:link action="viewMyResumes" controller="dashboard">Applications</g:link></li>
                	<li><g:link action="viewMyResumes" controller="dashboard">Calendar</g:link></li>
                	<li><g:link action="viewMyResumes" controller="dashboard">Pathways</g:link></li>
                </ul>
            </div>
        </div>
</div>
 <!--end header-->