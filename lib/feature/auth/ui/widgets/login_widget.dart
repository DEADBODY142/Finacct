import 'package:finacct/common/app/navigation_service.dart';
import 'package:finacct/common/app/theme.dart';
import 'package:finacct/common/bloc/data_state.dart';
import 'package:finacct/common/models/users.dart';
import 'package:finacct/common/shared_pref.dart';
import 'package:finacct/feature/auth/cubit/login_cubit.dart';
import 'package:finacct/feature/auth/ui/widgets/custom_snackbar.dart';
import 'package:finacct/pages/menu.dart';
import 'package:finacct/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool _rememberMe = false;
  bool _isLoading = false;
  bool _obscurePassword = true;
  TextEditingController staffIdController = TextEditingController(text: "");
  TextEditingController clientAliasController = TextEditingController(text: "");
  TextEditingController urlController = TextEditingController(
    text: "",
  );
  TextEditingController passwordController = TextEditingController(text: "");

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  void dispose() {
    staffIdController.dispose();
    clientAliasController.dispose();
    urlController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _loadSavedCredentials() async {
    final rememberMe = await SharedPref.getRememberMe();
    if (rememberMe) {
      setState(
        () {},
      );
    }
  }

  Future<void> _showErrorDialog() async {
    final String message = await SharedPref.getInvalidResponse();
    if (mounted) {
      showCustomSnackBar(
          context: context, message: message, textColor: Colors.red);
    }
  }

  void _handleLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      // setState(() => _isLoading = true);
      context.read<LoginCubit>().loginUser(
            username: staffIdController.text.trim(),
            password: passwordController.text,
            clientAlias: clientAliasController.text.trim(),
            actualBaseUrl: urlController.text.trim(),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocListener<LoginCubit, CommonState>(
      listener: (context, state) {
        if (state is CommonLoading) {
          setState(() => _isLoading = true);
        }
        if (state is CommonStateSuccess<User>) {
          setState(() => _isLoading = false);

          if (_rememberMe) {
            SharedPref.setUsername(staffIdController.text);
            SharedPref.setPassword(passwordController.text);
            SharedPref.setAlias(clientAliasController.text);
            SharedPref.setUrl(urlController.text);
            SharedPref.setRememberMe(true);
          }

          NavigationService.push(target:  Menu());
        } else if (state is CommonNoData) {
          showCustomSnackBar(
              context: context,
              message: "There is Connectivity issue!",
              textColor: Colors.red);
          setState(() => _isLoading = false);
        } else if (state is CommonError) {
          setState(() => _isLoading = false);
          _showErrorDialog();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                CustomTheme.appThemeColorSecondary,
                CustomTheme.appThemeColorSecondary.withOpacity(0.8),
              ],
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: size.height),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildHeader(),
                        _buildLoginForm(),
                        _buildFooter(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            CustomTheme.mainLogoWhite,
            width: 170,
            fit: BoxFit.contain,
          ),
          InkWell(
            onTap: () {
              NavigationService.push(target: const Register());
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(
                'assets/icons/setting.png',
                width: 32,
                height: 32,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginForm() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFE6F1FF),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2B2D42),
                ),
              ),
              const Text(
                'Sign in to continue',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF8D99AE),
                ),
              ),
              const SizedBox(height: 24),
              _buildInputField(
                controller: urlController,
                hintText: "API URL",
                onSuffixIconTap: () async {
                  final result = await SharedPref.getUrl();
                  setState(() {
                    urlController = TextEditingController(text: result);
                  });
                },
                prefixIcon: Icons.link,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the API URL';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              _buildInputField(
                controller: clientAliasController,
                hintText: "Client Alias",
                onSuffixIconTap: () async {
                  final result = await SharedPref.getAlias();
                  setState(() {
                    clientAliasController = TextEditingController(text: result);
                  });
                },
                prefixIcon: Icons.business,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter client alias';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              _buildInputField(
                controller: staffIdController,
                hintText: "Staff ID",
                prefixIcon: Icons.person,
                onSuffixIconTap: () async {
                  final result = await SharedPref.getUsername();
                  setState(() {
                    staffIdController = TextEditingController(text: result);
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter staff ID';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              _buildPasswordField(),
              const SizedBox(height: 8),
              _buildRememberMe(),
              const SizedBox(height: 24),
              _buildLoginButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    required IconData prefixIcon,
    VoidCallback? onSuffixIconTap,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hintText,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF2B2D42),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            hintText: 'Enter $hintText',
            hintStyle: const TextStyle(color: Color(0xFF8D99AE)),
            prefixIcon:
                Icon(prefixIcon, color: CustomTheme.appThemeColorPrimary),
            suffixIcon: IconButton(
              icon: const Icon(Icons.upload_file, color: Color(0xFF8D99AE)),
              onPressed: onSuffixIconTap,
            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFDEE2E6), width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                  color: CustomTheme.appThemeColorPrimary, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Password',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF2B2D42),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: passwordController,
          obscureText: _obscurePassword,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: 'Enter your password',
            hintStyle: const TextStyle(color: Color(0xFF8D99AE)),
            prefixIcon:
                const Icon(Icons.lock, color: CustomTheme.appThemeColorPrimary),
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword ? Icons.visibility_off : Icons.visibility,
                color: const Color(0xFF8D99AE),
              ),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFDEE2E6), width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                  color: CustomTheme.appThemeColorPrimary, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
        ),
      ],
    );
  }

  Widget _buildRememberMe() {
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: _rememberMe,
            activeColor: CustomTheme.appThemeColorPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            onChanged: (value) {
              setState(() {
                _rememberMe = value ?? false;
              });
            },
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            setState(() {
              _rememberMe = !_rememberMe;
            });
          },
          child: const Text(
            'Remember me',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF2B2D42),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomTheme.appThemeColorPrimary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        onPressed: _isLoading
            ? null
            : () {
                if (_rememberMe) {
                  _handleLogin();
                } else {
                  showCustomSnackBar(
                      context: context,
                      message: 'Please select "Remember me" to continue');
                }
              },
        child: _isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : const Text(
                'Login',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: const Text(
        CustomTheme.footerText,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    );
  }
}
