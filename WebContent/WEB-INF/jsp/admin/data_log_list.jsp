
<%@taglib prefix="test" uri="/WEB-INF/tlds/CommonCode.tld"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="cocd" uri="CommonCodeDescription"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="bc" uri="BreadCrumbs"%>
<%@taglib prefix="error" uri="ErrorCodeDescription"%>
<%@taglib prefix="branch" uri="/WEB-INF/tlds/BranchMaster.tld"%>
<%-- <%@taglib prefix="branch" uri="/WEB-INF/tlds/BranchMaster.tld"%> --%>
<script type="text/javascript" src="js/admin/dataLog.js"></script>


<div class="page-content">
	<!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
	<div id="portlet-config" class="modal hide"></div>
	<!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
	<!-- BEGIN PAGE CONTAINER-->
	<div class="container-fluid">
		<!-- BEGIN PAGE HEADER-->
		<div class="row-fluid">
			<div class="span12">
				<!-- BEGIN STYLE CUSTOMIZER-->
				
				<!-- END STYLE CUSTOMIZER-->
				<!-- BEGIN PAGE TITLE & BREADCRUMB-->
				<h3 class="page-title">
					Data Log<small></small>
				</h3>
				<bc:description output="result" />
				${result}
				<!-- END PAGE TITLE & BREADCRUMB-->
			</div>
		</div>



		<!-- END PAGE HEADER-->
		<!-- BEGIN PAGE CONTENT-->

		${exception.message}

		<c:if test="${success ne null }">
			<error:description code="${success}" type="success"
				result="description" />${description}
			</c:if>
		<c:if test="${error ne null }">
			<error:description code="${error}" type="error" result="description" />${description}
			</c:if>

		<div class="row-fluid">
			<div class="span12">
				<!-- BEGIN VALIDATION STATES-->
				<div class="portlet box yellow">
					<div class="portlet-title">
						<h4>
							<i class="icon-reorder"></i>Search
						</h4>
						<div class="tools">
							<a href="javascript:;" class="expand" id="expandForDataLog"></a>

						</div>
					</div>
					<div class="portlet-body form">

						<!-- BEGIN FORM-->
						<form:form commandName="dataLog" class="form-horizontal"
							method="GET" id="searchInDataLog" action="dataLog.htm"
							enctype="multipart/form-data">

							<div class="control-group">
								<label class="control-label" for="inputWarning">Branch
									Name<span class="comp">*</span>
								</label>
								<div class="controls">									

									<form:select path="branchId" class="span6 m-wrap "
										data-placeholder="Choose a Category" tabindex="1" id="branch">
										
											<form:options items="${branchList}"/>
									</form:select>
								</div> 							

							</div>
							<div class="control-group">
								<label class="control-label" for="inputWarning">From
									Date<span class="comp">*</span>
								</label>
								<div class="control-group">
									<div class="controls">
										<div class="input-append date date-picker" data-date=""
											data-date-format="yyyy-mm-dd" data-date-viewmode="years">
											<form:input path="fromDate" id="dateformat2"
												data-date-format="yyyy-mm-dd"
												class="m-wrap m-ctrl-medium  span11" size="16" value=""
												readonly="true" />
											<span class="add-on"><i class="icon-calendar"></i></span> <span
												class="help-inline"></span>
										</div>
									</div>
								</div>
							</div>

							<div class="control-group">
								<label class="control-label" for="inputSuccess">To Date<span
									class="comp">*</span>
								</label>
								<div class="control-group">
									<div class="controls">
										<div class="input-append date date-picker" data-date=""
											data-date-format="yyyy-mm-dd" data-date-viewmode="years">
											<form:input path="toDate" id="dateformat3"
												data-date-format="yyyy-mm-dd"
												class="m-wrap m-ctrl-medium  span11" size="16" value=""
												readonly="true" />
											<span class="add-on"><i class="icon-calendar"></i></span> <span
												class="help-inline"></span>
										</div>
									</div>
								</div>
							</div>

							<div class="control-group">
								<label class="control-label" for="inputSuccess">User Id
								</label>
								<div class="control-group">
									<div class="controls">
										<form:input path="userId" class="span6 m-wrap" />
										<span class="help-inline"></span>
									</div>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="inputSuccess">User
									Link Id </label>
								<div class="control-group">
									<div class="controls">
										<form:input path="linkId" class="span6 m-wrap" />
										<span class="help-inline"></span>
									</div>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="inputSuccess">Table
									Name </label>
								<div class="control-group">
									<div class="controls">
										<form:input path="tableName" class="span6 m-wrap" />
										<span class="help-inline"></span>
									</div>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="inputSuccess">Type Of
									Operation </label>
								<div class="control-group">
									<div class="controls">
										<form:select path="typeOfOperation"
											class="span6 m-wrap  academicYear"
											data-placeholder="Choose a Category" tabindex="1">
											<form:option value="null">Choose Type of Operation</form:option>
											<test:commoncode codeType="TOOP" output="res" />
											<c:forEach items="${res}" var="hel">
												<form:option value="${hel.commonCode}">${hel.codeDescription}</form:option>
											</c:forEach>
										</form:select>
										<span class="help-inline"></span>
									</div>
								</div>
							</div>

							<div class="control-group" id="get">
								<div class="controls">
									<input class="btn getInDataLog blue" name="Search"
										id="getBttnInDataLog" type="submit" value="Get" />
								</div>
							</div>

							<div style="clear: both;"></div>

						</form:form>
						<!-- END FORM-->

					</div>
				</div>
				<!-- END VALIDATION STATES-->
			</div>
		</div>


		<div class="row-fluid">
			<div class="span12">

				<!-- BEGIN EXAMPLE TABLE PORTLET-->
				<div class="portlet box grey">
					<div class="portlet-title">
						<h4>
							<i class="icon-reorder"></i>Result
						</h4>
						<div class="tools">
							<a href="javascript:;" class="expand" id='resultForDataLog'></a>


						</div>
					</div>
					<!-- requestURI="rollnogen.htm" -->

					<div class="portlet-body form">


						<!-- BEGIN FORM-->

						<div id="getTabValue" class="datLogResult">
							<form:form name="displ" commandName="dataLog" id="listOfRecList"
								action="dataLog.htm" method="GET">
								<div id="listOfRec">
									<!-- <input type="hidden" id="hiddenRowId" name="rowID" /> -->
									<display:table id="list"
										class="table table-striped table-bordered"
										name="sessionScope.display_tbl" keepStatus="true"
										clearStatus="${status}" pagesize="${dataLog.pageNo}"
										form="displ"
										decorator="com.pos.common.displayTag.DisplayTableDecorator"
										excludedParams="pano rowId branchId fromDate toDate userId pageNo linkId tableName typeOfOperation com.havila.jaw.displaytag.DateTimeDisplayColumnDecorator"
										sort="list" defaultsort="2">

										<display:column property="serialno" title="S.No"
											style="text-align:center;" />

										<display:column property="auditSrlNo" title="Record No"
											sortable="true" />

										<display:column property="rCreTime" title="Date"
											decorator="com.pos.common.displayTag.DateTimeDisplayColumnDecorator"
											sortable="true" />

										<display:column property="userId" title="Application User Id"
											sortable="true" />

										<display:column property="linkId" title="Link Id"
											sortable="true" />

										<display:column property="tableName" title="Table Name"
											sortable="true" />
										<cocd:description code="${list.typeOfOperation}" type="TOOP"
											output="res" />
										<display:column title="Type of Operation" sortable="true">
											<c:out value="${res}" />
										</display:column>
										<display:column>
											<a href="dataLogDetails.htm?rowid=${list.rowid}"
												class="icon-file details-info" title="Details"
												style="float: center;"></a>
										</display:column>



									</display:table>

									<c:if test="${sessionScope.display_tbl ne null}">
										<!-- <div id="result1" class="datLogResult"> -->
										<div class="control-group">
											<label class="control-label"></label>
											<div class="controls">
												<form:select path="pageNo" class="smallno m-wrap"
													tabindex="1" id="pageNo">
													<form:option value="5">5</form:option>
													<form:option value="10">10</form:option>
													<form:option value="15">15</form:option>
												</form:select>
												Records per page

											</div>
										</div>
										<!-- </div> -->

									</c:if>


								</div>

							</form:form>
						</div>

					</div>

					<!-- END EXAMPLE TABLE PORTLET-->
				</div>
			</div>

			<!-- END VALIDATION STATES-->


		</div>
	</div>
</div>
<!-- END PAGE CONTAINER-->
